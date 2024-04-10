class InvoicesController < ApplicationController
    # Action to create a new invoice
    def create
      invoice = Invoice.create(subtotal: 100.0, taxes: 10.0, total: 110.0)
      # Additional logic
    end
  
    # Action to retrieve all invoices
    def index
      @invoices = Invoice.all
      # Additional logic
    end
  
    # Action to update an invoice
    def update
      invoice = Invoice.find(params[:id])
      invoice.update(subtotal: 120.0)
      # Additional logic
    end
  
    # Action to delete an invoice
    def destroy
      invoice = Invoice.find(params[:id])
      invoice.destroy
      # Additional logic
    end
  end
  