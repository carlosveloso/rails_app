require 'spec_helper'

describe "Static pages" do
	subject { page }
	describe "Home page" do

		before { visit root_path }

		## ABAJO REFACTORIZADO EN UNA LINEA
		# it "Should have the content 'Pagina de prueba'" do
		# 	page.should have_selector('h1', text: 'Bienvenido a la pagina de prueba')
		# end
		# it "Deberia tener el titulo base" do
		# 	page.should have_title("Aplicacion de pruebas")
		# end
		# it "No deberia tener el titulo dinamico" do
		# 	page.should_not have_selector('title', text: ' | Home')
		# end

		# it { print page.html} #Prints the html

		it { should have_selector('h1', text: 'Bienvenido a la pagina de prueba') }
		it { should have_title(full_title('')) }
		it { should_not have_selector('title', text: ' | Home') }
	end

	describe "Help page" do
		before { visit help_path }
		it { should have_title(full_title('Ayuda')) }
		it { should have_selector('h1', text: 'Pagina de ayuda') }
	end

	describe "About page" do
		before { visit about_path }
		it { should have_title(full_title('Acerca')) }
		it { should have_selector('h1', text: 'Pagina de acerca') }
	end

	describe "Contact page" do
		before { visit contact_path }
		it { should have_title(full_title('Contacto')) }
		it { should have_selector('h1', text: 'Pagina de contacto') }
	end

	it "Should have the correct links" do
		visit root_path

		click_link "Home"
		page.should have_selector 'h1', text: 'Bienvenido a la pagina de prueba'

		click_link "Help"
		page.should have_title(full_title('Ayuda'))

		click_link "Ingresar"
		page.should have_title(full_title('Registro'))

		click_link "About"
		page.should have_title(full_title('Acerca'))

		click_link "Contact"
		page.should have_title(full_title('Contacto'))
	end
end