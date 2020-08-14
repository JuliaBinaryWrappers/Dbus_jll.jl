# Autogenerated wrapper script for Dbus_jll for armv7l-linux-gnueabihf
export dbus_daemon, libdbus

using Expat_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `dbus_daemon`
const dbus_daemon_splitpath = ["bin", "dbus-daemon"]

# This will be filled out by __init__() for all products, as it must be done at runtime
dbus_daemon_path = ""

# dbus_daemon-specific global declaration
function dbus_daemon(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(dbus_daemon_path)
    end
end


# Relative path to `libdbus`
const libdbus_splitpath = ["lib", "libdbus-1.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libdbus_path = ""

# libdbus-specific global declaration
# This will be filled out by __init__()
libdbus_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libdbus = "libdbus-1.so.3"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Dbus")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Expat_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Expat_jll.LIBPATH_list,))

    global dbus_daemon_path = normpath(joinpath(artifact_dir, dbus_daemon_splitpath...))

    push!(PATH_list, dirname(dbus_daemon_path))
    global libdbus_path = normpath(joinpath(artifact_dir, libdbus_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libdbus_handle = dlopen(libdbus_path)
    push!(LIBPATH_list, dirname(libdbus_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

