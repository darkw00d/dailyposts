class ContentController < ApplicationController
 

  def view
 @top = HeadLine.sorted
@subs = Subject.sorted
@theme = Theme.sorted
  end

def create

@head = HeadLine.new(head_params)
    if @head.save

subjects = @head.text.scan(/@([a-z0-9_]+)/i)
subjects.each do |s|
z = s.to_s
z[0...2]=''
h = z.length
z[(h-2)...(h)]=''
if Subject.where(:text => z).empty?
newsub = Subject.new(:text=> z)
newsub.save 
else
end
end

subjects = @head.text.scan(/#([a-z0-9_]+)/i)
subjects.each do |s|
  z = s.to_s
z[0...2]=''
h = z.length
z[(h-2)...(h)]=''
if Theme.where(:text=> z).empty?
newsub = Theme.new(:text=> z)
newsub.save 

newsub.head_lines << @head
else
end
end
     redirect_to(:controller => 'content', :action => 'view')
end
end

def selecthead
@selected = HeadLine.find(params[:id])
@switch = "h"
render 'selected'
end

def selecttheme
@selected = Theme.find(params[:id])
@switch = "t"
render 'selected'
end


def selectsub
@selected = Subject.find(params[:id])
@switch = "s"
render 'selected'
end

def contentadd
@headlines = HeadLine.find(params[:id])
 @place = (params[:place])
render 'add'
end

def add
  @headlines = HeadLine.find(params[:headline])
  @content = Content.new(content_params)
  @content.place = (params[:place]).to_i
  @content.save
  @headlines.contents << @content

    if @content.save
  
     subjects = @content.text.scan(/@([a-z0-9_]+)/i)
subjects.each do |s|
  z = s.to_s
z[0...2]=''
h = z.length
z[(h-2)...(h)]=''

if Subject.where(:text => z).empty?
newsub = Subject.new(:text=> z)
newsub.save 

else
end
end

subjects = @content.text.scan(/#([a-z0-9_]+)/i)
subjects.each do |s|
  z = s.to_s
z[0...2]=''
h = z.length
z[(h-2)...(h)]=''
if Theme.where(:text=> z).empty?
newsub = Theme.new(:text=> z)
newsub.save 


else
end
end

#   redirect_to(:controller => 'content', :action => 'view')
@selected = @headlines
@switch = "h"
render 'selected'

end
end


def contentup
@content = HeadLine.find(params[:head])
@content.score = @content.score + 1
@content.save

@content = Content.find(params[:id])
@content.score = @content.score + 1
@content.save

@selected = HeadLine.find(params[:head])
@switch = "h"

render 'selected'
end

def contentdown
@content = Content.find(params[:id])
@content.score = @content.score - 1
@content.save

@content = HeadLine.find(params[:head])
@content.score = @content.score - 1
@content.save

@selected = HeadLine.find(params[:head])
@switch = "h"
render 'selected'

end


def themeadd
@theme = Theme.find(params[:id])
render 'addtheme'
end

def tadd
  @theme = Theme.find(params[:theme])
  @headline = HeadLine.new(head_params)
  
  @headline.save
  @theme.head_lines << @headline
  
@selected = @headline
@switch = "t"
render 'selected'
end



def themeup
 @content = HeadLine.find(params[:id])
@content.score = @content.score + 1
@content.save

@content = Theme.find(params[:theme])
@content.score = @content.score + 1
@content.save

@selected = Theme.find(params[:theme])
@switch = "t"
render 'selected'

  end

def themedown
@content = HeadLine.find(params[:id])
@content.score = @content.score - 1
@content.save

@content = Theme.find(params[:theme])
@content.score = @content.score - 1
@content.save

@selected = Theme.find(params[:theme])
@switch = "t"
render 'selected'
end


def subjectadd
@subject = Subject.find(params[:id])
render 'addhead'
end

def sadd
  @subject = Subject.find(params[:subject])
  @headline = HeadLine.new(head_params)
  
  @headline.save
  @subject.head_lines << @headline
  @switch = "h"
  @selected = @headline
render 'selected'
end



def subjectup
@content = Subject.find(params[:head])
@selected = Subject.find(params[:head])
@content.score = @content.score + 1
@content.save

@content = HeadLine.find(params[:id])
@content.score = @content.score + 1
@content.save


@switch = "s"
render 'selected'

  end


def subjectdown
@content = Subject.find(params[:head])
@selected = Subject.find(params[:head])
@content.score = @content.score - 1
@content.save

@content = HeadLine.find(params[:id])
@content.score = @content.score - 1
@content.save


@switch = "s"
render 'selected'

  end










    def head_params

      params.require(:head_line).permit(:text)
    end

    def content_params
      params.require(:content).permit(:text, :place,:image)
    end

end
