defmodule Explorer.Repo.Account.Migrations.RemoveUnencryptedFields do
  use Ecto.Migration

  def change do
    alter table(:account_identities) do
      remove(:uid)
      remove(:email)
      remove(:name)
      remove(:nickname)
      remove(:avatar)
    end

    rename(table(:account_identities), :encrypted_uid, to: :uid)
    rename(table(:account_identities), :encrypted_email, to: :email)
    rename(table(:account_identities), :encrypted_name, to: :name)
    rename(table(:account_identities), :encrypted_nickname, to: :nickname)
    rename(table(:account_identities), :encrypted_avatar, to: :avatar)

    # alter table(:account_watchlists) do
    #   remove(:name)
    # end
    # rename(table(:account_watchlists), :encrypted_name, to: :name)

    alter table(:account_custom_abis) do
      remove(:address_hash)
      remove(:name)
    end

    rename(table(:account_custom_abis), :encrypted_address_hash, to: :address_hash)
    rename(table(:account_custom_abis), :encrypted_name, to: :name)

    alter table(:account_tag_addresses) do
      remove(:address_hash)
      remove(:name)
    end

    rename(table(:account_tag_addresses), :encrypted_address_hash, to: :address_hash)
    rename(table(:account_tag_addresses), :encrypted_name, to: :name)

    alter table(:account_tag_transactions) do
      remove(:tx_hash)
      remove(:name)
    end

    rename(table(:account_tag_transactions), :encrypted_tx_hash, to: :tx_hash)
    rename(table(:account_tag_transactions), :encrypted_name, to: :name)

    alter table(:account_watchlist_addresses) do
      remove(:address_hash)
      remove(:name)
    end

    rename(table(:account_watchlist_addresses), :encrypted_address_hash, to: :address_hash)
    rename(table(:account_watchlist_addresses), :encrypted_name, to: :name)

    alter table(:account_watchlist_notifications) do
      remove(:to_address_hash)
      remove(:from_address_hash)
      remove(:transaction_hash)
      remove(:subject)
      remove(:name)
    end

    rename(table(:account_watchlist_notifications), :encrypted_name, to: :name)
    rename(table(:account_watchlist_notifications), :encrypted_subject, to: :subject)
    rename(table(:account_watchlist_notifications), :encrypted_from_address_hash, to: :from_address_hash)
    rename(table(:account_watchlist_notifications), :encrypted_to_address_hash, to: :to_address_hash)
    rename(table(:account_watchlist_notifications), :encrypted_transaction_hash, to: :transaction_hash)
  end
end
