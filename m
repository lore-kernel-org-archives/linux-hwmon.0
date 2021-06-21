Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0D8BC4743C
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Jun 2021 15:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADCA16113E
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Jun 2021 15:32:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhFUPeP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Jun 2021 11:34:15 -0400
Received: from mga04.intel.com ([192.55.52.120]:20677 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230311AbhFUPeO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Jun 2021 11:34:14 -0400
IronPort-SDR: qMTkAZ8sxh6QVcKB62b2e7QnrdZo9eV+edSWRUo+0qUEvIGC9bdGcQ2UxcKhPeOYYJYWQXaLdd
 6m1FpmG61sqQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="205043508"
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="205043508"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2021 08:32:00 -0700
IronPort-SDR: GqPy5gAMEATWp+3kVxyawtHRICMqrpM6qxhAYmb3LHj9iEtZ8QRXG/M0/e4ZsnY3yDljdaVe1+
 w5Vifa+bM70w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="641355390"
Received: from pl-dbox.sh.intel.com (HELO pl-dbox) ([10.239.159.39])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jun 2021 08:31:58 -0700
Date:   Mon, 21 Jun 2021 23:24:30 +0800
From:   Philip Li <philip.li@intel.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [kbuild-all] [hwmon:hwmon-next 47/47] make[2]: *** No rule to
 make target
 '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/crypto/cmac.ko',
 needed by '__modinst'.
Message-ID: <20210621152430.GI158568@pl-dbox>
References: <202106212044.6cWpzKdG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106212044.6cWpzKdG-lkp@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jun 21, 2021 at 08:37:51PM +0800, kernel test robot wrote:
> Hi Dmitry,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   4c7f85a321a1ac265159c22a6998ef4f2a60c21d
> commit: 4c7f85a321a1ac265159c22a6998ef4f2a60c21d [47/47] hwmon: (lm90) Disable interrupt on suspend
> config: x86_64-randconfig-a012-20210621 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project e1adf90826a57b674eee79b071fb46c1f5683cd0)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=4c7f85a321a1ac265159c22a6998ef4f2a60c21d
>         git remote add hwmon https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>         git fetch --no-tags hwmon hwmon-next
>         git checkout 4c7f85a321a1ac265159c22a6998ef4f2a60c21d
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
Sorry for the broken report, kindly ignore this, we will fix
this asap.

> 
>    arch/x86/Makefile:148: CONFIG_X86_X32 enabled but no binutils support
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/crypto/cmac.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/crypto/md5.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/crypto/sha512_generic.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/drivers/net/net_failover.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/drivers/net/virtio_net.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/fs/cifs/cifs.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/fs/nfs/nfsv4.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/lib/crypto/libarc4.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/net/core/failover.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/net/dns_resolver/dns_resolver.ko', needed by '__modinst'.
> >> make[2]: *** No rule to make target '/tmp/kernel/x86_64-randconfig-a012-20210621/clang-13/4c7f85a321a1ac265159c22a6998ef4f2a60c21d/lib/modules/5.13.0-rc6+/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko', needed by '__modinst'.
>    make[2]: Target '__modinst' not remade because of errors.
>    make[1]: *** [Makefile:1770: modules_install] Error 2
>    make: *** [Makefile:215: __sub-make] Error 2
>    make: Target 'modules_install' not remade because of errors.
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org

