Dado "portfólio possui o bloco {string} à {word}" do |kind, side|
  add_block(kind, side)
end


Quando "adiciona um bloco {string} à {word}" do |kind, side|
  add_block(kind, side)
end


Então "o bloco {string} é adicionado ao portfólio" do |kind|
  class_to_check = kind.downcase
  expect(page).to have_css(".bloco-#{class_to_check}")
end

private

def add_block(kind, side)
  find("#add-#{side}-block").click
  within "#add-block-modal" do
    select kind, from: "select-block-kind"
    find("#confirm-add-block").click
  end
  wait_for_ajax
end
