# Autogenerated wrapper script for Dbus_jll for armv7l-linux-gnueabihf
export dbus_daemon, libdbus

using Expat_jll
JLLWrappers.@generate_wrapper_header("Dbus")
JLLWrappers.@declare_executable_product(dbus_daemon)
JLLWrappers.@declare_library_product(libdbus, "libdbus-1.so.3")
function __init__()
    JLLWrappers.@generate_init_header(Expat_jll)
    JLLWrappers.@init_executable_product(
        dbus_daemon,
        "bin/dbus-daemon",
    )

    JLLWrappers.@init_library_product(
        libdbus,
        "lib/libdbus-1.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
