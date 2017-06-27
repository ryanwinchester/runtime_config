defmodule Config do
  @moduledoc false

  @doc """
  Get all the config runtime values for an app.
  Parses `{:system, "ENV_NAME"}` values to get environment variable values.
  """
  @spec get_all_env(Atom.t) :: List.t
  def get_all_env(app) do
    app
    |> Application.get_all_env()
    |> get_all_runtime_values()
  end

  @doc """
  Get config runtime value from app and key.
  Parses `{:system, "ENV_NAME"}` values to get environment variable values.
  """
  @spec get_env(Atom.t, Atom.t, any) :: any
  def get_env(app, key, default \\ nil) do
    app
    |> Application.get_env(key, default)
    |> get_runtime_value()
  end

  @doc false
  @spec get_all_runtime_values(List.t) :: List.t
  def get_all_runtime_values(app_envs) do
    Enum.map(app_envs, fn {key, val} ->
      {key, get_runtime_value(val)}
    end)
  end

  @doc false
  @spec get_runtime_value({:system, String.t} | any) :: any
  def get_runtime_value({:system, env_key}) do
    System.get_env(env_key)
  end
  def get_runtime_value(conf), do: conf
end
