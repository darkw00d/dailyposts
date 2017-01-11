class ContentController < ApplicationController
 

  def view
 @top = HeadLine.sorted
@subs = Subject.sorted
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
       else
 
 
  end


end

def selecthead
@selected = Subject.find(params[:id])
@headlines = @selected.head_lines
render 'selected'
end


    def head_params

      params.require(:head_line).permit(:text)
    end

end
