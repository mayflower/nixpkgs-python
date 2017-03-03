# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python35;
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreter = pythonPackages.buildPythonPackage {
        name = "python35-interpreter";
        buildInputs = [ makeWrapper ] ++ (builtins.attrValues pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -f $prog ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };
    in {
      __old = pythonPackages;
      inherit interpreter;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {

    "Mako" = python.mkDerivation {
      name = "Mako-1.0.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e/Mako-1.0.6.tar.gz"; sha256 = "48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "A super-fast templating language that borrows the  best ideas from the existing templating languages.";
      };
    };



    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-0.23";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz"; sha256 = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };



    "SQLAlchemy" = python.mkDerivation {
      name = "SQLAlchemy-1.1.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/24/de/66d96cbad7a91443af1399469e9aa0aec8a41669ba6d0faae8b8411ddb27/SQLAlchemy-1.1.6.tar.gz"; sha256 = "815924e3218d878ddd195d2f9f5bf3d2bb39fabaddb1ea27dace6ac27d9865e4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Database Abstraction Library";
      };
    };



    "alembic" = python.mkDerivation {
      name = "alembic-0.9.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/97/00/3e6797a2e4209db69d23b223ae3148d5f3605dafba6a332670de7a12c147/alembic-0.9.1.tar.gz"; sha256 = "767cf6c8c4578f1f625f17bfbc8716a7d4f80a0c1efc7a9b72af30ad68954962"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Mako"
      self."SQLAlchemy"
      self."python-editor"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "A database migration tool for SQLAlchemy.";
      };
    };



    "appdirs" = python.mkDerivation {
      name = "appdirs-1.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/88/99/293dac0b3cdf58ce029ec5393624fac5c6bde52f737f9775bd9ef608ec98/appdirs-1.4.2.tar.gz"; sha256 = "e2de7ae2b3be52542b711eacf4221683f1d2f7706a5550cb2c562ee4ba93ee74"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "A small Python module for determining appropriate platform-specific dirs, e.g. a \"user data dir\".";
      };
    };



    "atpublic" = python.mkDerivation {
      name = "atpublic-0.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/58/5b/a1e1384646d76780339a77368f421faca742685cbf037c1df2b9fcadcf24/atpublic-0.5.tar.gz"; sha256 = "40a20d59bd64320888e81c21b43bd04d2187175f007bf6562c986f2830ac284a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.asl20;
        description = "public -- @public for populating __all__";
      };
    };



    "falcon" = python.mkDerivation {
      name = "falcon-0.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/35/18/a4fbbd570b643e57f1c24af87a6cd2a5a33b433c3eeaf735944134b30696/falcon-0.3.0.tar.gz"; sha256 = "f27602b5a2ff8ee40b3179b3f5bdb9af09efbcd9af9bb7f01ad6a28ad0fc3b82"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."python-mimeparse"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.asl20;
        description = "An unladen web framework for building APIs and app backends.";
      };
    };



    "flufl.bounce" = python.mkDerivation {
      name = "flufl.bounce-3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f2/97/433f91a26012630e0aa481ae9648af6cd4ea0a8d85465db9c7c0738ff00b/flufl.bounce-3.0.tar.gz"; sha256 = "a2c549fc40a58ddfa9dfd115fe43d5cac4f042e45bacef3be7fb993e1496b34c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."atpublic"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Email bounce detectors.";
      };
    };



    "flufl.i18n" = python.mkDerivation {
      name = "flufl.i18n-1.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a8/0b/2a9f986593258bfe3172dc764fac876a56a22cbfc5d5bdea080ba2b29134/flufl.i18n-1.1.3.tar.gz"; sha256 = "bb743c1101936138edf6f6b0dd9f77f157ca6b5f38c608f440fd16b59c4c5130"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl3Plus;
        description = "A high level API for Python internationalization.";
      };
    };



    "flufl.lock" = python.mkDerivation {
      name = "flufl.lock-2.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/83/a2/27ed60c21c4315d8ecb012960c3dfd17d4e40f22b6f228ab30de64c35f55/flufl.lock-2.4.1.tar.gz"; sha256 = "72639aca3ef0379aef125c7346b042691c3452152843f301801b3c2ddcac1032"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl3Plus;
        description = "NFS-safe file locking with timeouts for POSIX systems.";
      };
    };



    "httplib2" = python.mkDerivation {
      name = "httplib2-0.10.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e4/2e/a7e27d2c36076efeb8c0e519758968b20389adf57a9ce3af139891af2696/httplib2-0.10.3.tar.gz"; sha256 = "e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "A comprehensive HTTP client library.";
      };
    };



    "lazr.config" = python.mkDerivation {
      name = "lazr.config-2.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/38/11/3d4e57225f51580bee6984b6840bb13c064a7c48a7cf64192b5f3f6de5e8/lazr.config-2.2.tar.gz"; sha256 = "21c6bb23a93e6653a72158e0f393f13b6f9db7408a44532d515c347a5987d777"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."lazr.delegates"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl2;
        description = "Create configuration schemas, and process and validate configurations.";
      };
    };



    "lazr.delegates" = python.mkDerivation {
      name = "lazr.delegates-2.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ef/9d/c36689aabf7c0b1520fea0678e865b6103d169f924a554d7b4cef15c03f1/lazr.delegates-2.0.3.tar.gz"; sha256 = "51c80d5ac2c1f8f4a8c75fa271646529c8a6393a0b088dab50fb62138d092ee9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl2;
        description = "Easily write objects that delegate behavior";
      };
    };



    "lazr.smtptest" = python.mkDerivation {
      name = "lazr.smtptest-2.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fe/b3/d7383b211ea130be1944f4f34bbc06ecaf2726674c48e05ac5cadc95173e/lazr.smtptest-2.0.3.tar.gz"; sha256 = "9dca1890677a7fd022b1e36ea52dd22cea8bd3a3f2decb5b9625207b8ebf6e15"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl2;
        description = "A test framework for SMTP based applications";
      };
    };



    "mailman" = python.mkDerivation {
      name = "mailman-3.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/99/cd/5f6387098644d0dfc25950c497db4c72207b24328aeb8440adf9953f92ea/mailman-3.0.3.tar.gz"; sha256 = "9b826453e2cb01aeb0d231bc41aeb60012c1bd97964b57a5074e975d23b74d6e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."SQLAlchemy"
      self."alembic"
      self."falcon"
      self."flufl.bounce"
      self."flufl.i18n"
      self."flufl.lock"
      self."httplib2"
      self."lazr.config"
      self."lazr.smtptest"
      self."nose2"
      self."passlib"
      self."zope.component"
      self."zope.configuration"
      self."zope.event"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl3Plus;
        description = "Mailman -- the GNU mailing list manager";
      };
    };



    "nose" = python.mkDerivation {
      name = "nose-1.3.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/58/a5/0dc93c3ec33f4e281849523a5a913fa1eea9a3068acfa754d44d88107a44/nose-1.3.7.tar.gz"; sha256 = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.lgpl2;
        description = "nose extends unittest to make testing easier";
      };
    };



    "nose2" = python.mkDerivation {
      name = "nose2-0.6.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/49/6a/8f203ea5d82590b9e70577be37f6482b791410f6d700a6a14c5299b6ed7d/nose2-0.6.5.tar.gz"; sha256 = "479bab6880468f26fd8a1301d222ec97243e9a539501b5d242307bfa03969ff4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "nose2 is the next generation of nicer testing for Python";
      };
    };



    "packaging" = python.mkDerivation {
      name = "packaging-16.8";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c6/70/bb32913de251017e266c5114d0a645f262fb10ebc9bf6de894966d124e35/packaging-16.8.tar.gz"; sha256 = "5d50835fdf0a7edf0b55e311b7c887786504efea1177abd7e69329a8e5ea619e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyparsing"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Core utilities for Python packages";
      };
    };



    "passlib" = python.mkDerivation {
      name = "passlib-1.7.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/25/4b/6fbfc66aabb3017cd8c3bd97b37f769d7503ead2899bf76e570eb91270de/passlib-1.7.1.tar.gz"; sha256 = "3d948f64138c25633613f303bcc471126eae67c04d5e3f6b7b8ce6242f8653e0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "comprehensive password hashing framework supporting over 30 schemes";
      };
    };



    "pyparsing" = python.mkDerivation {
      name = "pyparsing-2.1.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/38/bb/bf325351dd8ab6eb3c3b7c07c3978f38b2103e2ab48d59726916907cd6fb/pyparsing-2.1.10.tar.gz"; sha256 = "811c3e7b0031021137fc83e051795025fcb98674d07eb8fe922ba4de53d39188"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Python parsing module";
      };
    };



    "python-editor" = python.mkDerivation {
      name = "python-editor-1.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/65/1e/adf6e000ea5dc909aa420352d6ba37f16434c8a3c2fa030445411a1ed545/python-editor-1.0.3.tar.gz"; sha256 = "a3c066acee22a1c94f63938341d4fb374e3fdd69366ed6603d7b24bed1efc565"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Programmatically open an editor, capture the result.";
      };
    };



    "python-mimeparse" = python.mkDerivation {
      name = "python-mimeparse-1.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0f/40/ac5f9e44a55b678c3cd881b4c3376e5b002677dbeab6fb3a50bac5d50d29/python-mimeparse-1.6.0.tar.gz"; sha256 = "76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "A module provides basic functions for parsing mime-type names and matching them against a list of media-ranges.";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };



    "zope.component" = python.mkDerivation {
      name = "zope.component-4.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c9/56/501d51f0277af1899d1381e4b9928b5e14675187752622ddc344a756439d/zope.component-4.3.0.tar.gz"; sha256 = "bb4136c7443610f8c2d2d357cad247c3e90bb5e6f0b7a02b0edfb11924ff9bc2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
      self."zope.configuration"
      self."zope.event"
      self."zope.i18nmessageid"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Component Architecture";
      };
    };



    "zope.configuration" = python.mkDerivation {
      name = "zope.configuration-4.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/37/d7/653c2a05d876e787a1532b51ef7f89917ff17885daaac41af9da5e2f140b/zope.configuration-4.0.3.tar.gz"; sha256 = "b6f0f718597945fc6fda7aee72dab9636302fb2035dd222ab5b7fa773d762df5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Zope Configuration Markup Language (ZCML)";
      };
    };



    "zope.event" = python.mkDerivation {
      name = "zope.event-4.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cd/a5/4927363244aaa7fd8a696d32005ea8214c4811550d35edea27797ebbd4fd/zope.event-4.2.0.tar.gz"; sha256 = "ce11004217863a4827ea1a67a31730bddab9073832bdb3b9be85869259118758"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Very basic event publishing system";
      };
    };



    "zope.i18nmessageid" = python.mkDerivation {
      name = "zope.i18nmessageid-4.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/97/16/e76c4d7833d8e4246e0ebec826b68facbf21c97a1a62a9292f0b2779e3a1/zope.i18nmessageid-4.0.3.tar.gz"; sha256 = "b4feca4eda7361d8451fac473dbf1a6006e1bb049278296b4365d209e0f554e7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Message Identifiers for internationalization";
      };
    };



    "zope.interface" = python.mkDerivation {
      name = "zope.interface-4.3.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/44/af/cea1e18bc0d3be0e0824762d3236f0e61088eeed75287e7b854d65ec9916/zope.interface-4.3.3.tar.gz"; sha256 = "8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de6078dfa88"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
      self."zope.event"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "Interfaces for Python";
      };
    };



    "zope.schema" = python.mkDerivation {
      name = "zope.schema-4.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0d/b2/41fdc6c42c4320f326c65810eff785247e65e4ea856cff15120e47b93509/zope.schema-4.4.2.tar.gz"; sha256 = "d32a089d2a774fe67fd19864780e12ebd88d09e89b5c780f6c0795d59b1c24dd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
      self."zope.event"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.zpt21;
        description = "zope.interface extension for defining data schemas";
      };
    };

  };
  overrides = import ./requirements_override.nix { inherit pkgs python; };

in python.withPackages (fix' (extends overrides generated))