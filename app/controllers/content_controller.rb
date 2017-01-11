class ContentController < ApplicationController
 

  def view
 @top = HeadLine.sorted
@subs = Subject.sorted
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

if Subject.where(:name=> z).empty?
newsub = Subject.new(:name=> z)
newsub.save 
else
end
end
       else
 
    redirect_to(:controller => 'content', :action => 'view')
  end


end

def selected
@selected = Subject.find(params[:id])
render 'selected'
end


    def head_params

      params.require(:head_line).permit(:text)
    end

end
