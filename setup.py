import sys
import os
import logging
import logging.config

from logging import info, warn

def symlink_files_to_path(src, dst):
    '''symlink stuff'''
    src = os.path.abspath(src)
    dst = os.path.abspath(dst)
    info('Linking: {0:20s} -> {1:20s}'.format(src, dst))
    prevpath = os.getcwd()
    os.chdir(src)
    for (path, subpath, files) in os.walk("."):
        path = path[2:]
        for fname in files:
            src_i = os.path.join(src, path, fname)
            dst_i = os.path.join(dst, path, fname)
            oper = "create"
            if os.path.lexists(dst_i):
                oper = "recreate"
                os.remove(dst_i)
            else:
                if not os.path.exists(os.path.dirname(dst_i)):
                    os.makedirs(os.path.dirname(dst_i))
                    oper = "path create"
            info("{0:15s} {1:108s} -> {2:20s}".format(oper.upper(), src_i, dst_i))
            os.symlink(src_i, dst_i)
            if not os.path.exists(dst_i):
                warn("Something went wrong linking {0}".format(dst_i))
    os.chdir(prevpath)


def main(args):
    '''main routine'''
    print "bgs-config"
    home = os.environ["HOME"]
    symlink_files_to_path("files-to-symlink", home)
    symlink_files_to_path("exec-scripts", os.path.join(home, "local", "bin"))


if __name__ == '__main__':
    configfname = os.path.expanduser("~/.pylogrc")
    if os.path.exists(configfname):
        logging.config.fileConfig(configfname)
    else:
        logging.basicConfig(level=logging.INFO)
    main(sys.argv[1:])
