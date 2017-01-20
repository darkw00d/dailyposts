class ContentController < ApplicationController
 

  def view
 @top = HeadLine.sorted
@subs = Subject.sorted
@theme = Theme.sorted
  end

def create




@head = HeadLine.new(head_params)
    if @head.save
     redirect_to(:controller => 'content', :action => 'view')
     subjects = @head.text.scan(/@([a-z0-9_]+)/i)
subjects.each do |s|
	z = s.to_s
z[0...2]=''
h = z.length
z[(h-2)...(h)]=''

if Subject.where(:name=> z).empty?
newsub = Subject.new(:name=> z)
newsub.save 

newsub.head_lines << @head

else
end
end

 subjects = @head.text.scan(/#([a-z0-9_]+)/i)
subjects.each do |s|
  z = s.to_s
z[0...2]=''
h = z.length
z[(h-2)...(h)]=''
if Theme.where(:name=> z).empty?
newsub = Theme.new(:name=> z)
newsub.save 

newsub.head_lines << @head
else
end
end

       else
  end
end

def selecthead
@selected = HeadLine.find(params[:id])
#@headlines = @selected.contents.sorted
@switch = "h"
render 'selected'
end


def selectsub
@selected = Subject.find(params[:id])
#@headlines = @selected.head_lines
@switch = "s"
render 'selected'
end

def contentadd
@headlines = HeadLine.find(params[:id])

 @place = (params[:place])

render 'add'

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


def add
  @headlines = HeadLine.find(params[:headline])
  @content = Content.new(content_params)
  @content.place = (params[:place]).to_i
  @content.save
  @headlines.contents << @content
  
   redirect_to(:controller => 'content', :action => 'view')
end






    def head_params

      params.require(:head_line).permit(:text)
    end

    def content_params
      params.require(:content).permit(:text, :place)
    end

end
