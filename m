Return-Path: <SRS0=cJ4m=A6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C839C433DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Jul 2020 09:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66829207DF
	for <linux-hwmon@archiver.kernel.org>; Sun, 19 Jul 2020 09:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDxR+phu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgGSJii (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 19 Jul 2020 05:38:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGSJii (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 19 Jul 2020 05:38:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29512C0619D2;
        Sun, 19 Jul 2020 02:38:38 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r19so17061503ljn.12;
        Sun, 19 Jul 2020 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lyhG7PdExAerDeZ3s2kYYrknURi4Fdzs7NfcmzhEdmA=;
        b=SDxR+phuekH7kcy45MxYbLR3t1CIbgIA8pWR4XhL8W0DTwUKVyyEVzQvjOJZq8oIdp
         VteworWkq8hRaEJjuFOWZotH1ZrN+TdgC7wVGSgaw6Z0glO8Qjg4CaKusPDs76ffoYzy
         dnQPNmOb7Dm0sKv3WPa5D/qSyuB3Poz18VCsB28xor7sh2/ArVtBpPZKdyfTM6Ba1cW/
         GwjF8SrbJr2M8FsePifApm5f6BIm89aAhPVx0XfABP4a0YmH+6wGumDosl6DtCrRTLe9
         qdUxF8oQmaimMXtm5XDe7eGB40n2Z2zElAE40RHPQXtfmFshU0Qj9TaDBMqlYjwJ1F/Z
         RZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lyhG7PdExAerDeZ3s2kYYrknURi4Fdzs7NfcmzhEdmA=;
        b=Hes0oltYEVOfPv1LrU4DAyoiZTLrZQ7RxuafmQ7S/2xPpGri+hZMh1zD9KFbJzn2SZ
         3IB7QL6dJum30LV5GaW41YTNHM0324rOjsHTLj2T4VdNd/8MTPvFIuwN9a1u2SsTLAzU
         17NEQ7ASieDfGubM5KRjJTIBV9gqaZ44cJtMqcxolWS7+ZRT277wHWSRNsvuMMpKVYmS
         eiWo0+x4v/z6zFlKNc4ECdT/VW7vFWMXKFyWyqtaQnTKjs4y/N7JMeC6hAqZupwkH9Pe
         Aq/yz1KtflE7Bs8xB3mhhB16YbktL3TpZLsZ9BuPArpjsMgul1nQpJIb2qMaTZqGQwY/
         z6ng==
X-Gm-Message-State: AOAM531U1PRkrxFSn0HzCpyfXLZ9HA4wjQYPL3eeMBsAGAyvk/w63k5y
        eIyvk4dDO4v5X1O0i+uA3L6k7mQs+/HbqbS8INrZDogymDSugg==
X-Google-Smtp-Source: ABdhPJyCr0GGu51DGO3XBB2e7JyNcOgxefaNma5u+D/EQVEGK7s0KeyaNP1neNNc+V8Y4Z89a7QdLK1UvlMRZ5decOI=
X-Received: by 2002:a2e:9b42:: with SMTP id o2mr7653945ljj.102.1595151516448;
 Sun, 19 Jul 2020 02:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200717121642.41022-1-jaap.aarts1@gmail.com> <202007190844.mNvV0B06%lkp@intel.com>
In-Reply-To: <202007190844.mNvV0B06%lkp@intel.com>
From:   jaap aarts <jaap.aarts1@gmail.com>
Date:   Sun, 19 Jul 2020 11:38:25 +0200
Message-ID: <CACtzdJ183FF31S3J2ki7E1xkAOBsGiSAudc__Q578RUR9zC5XA@mail.gmail.com>
Subject: Re: [PATCH V2] hwmon: add fan/pwm driver for corsair h100i platinum
To:     kernel test robot <lkp@intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-usb@vger.kernel.org,
        kbuild-all@lists.01.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I tried to reproduce this, but I got the error:
xtensa-linux-gcc: error: missing argument to '-Wframe-larger-than='
at the last step using the provided config.

Jaap Aarts

On Sun, 19 Jul 2020 at 02:31, kernel test robot <lkp@intel.com> wrote:
>
> Hi jaap,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on hwmon/hwmon-next]
> [also build test ERROR on v5.8-rc5 next-20200717]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/jaap-aarts/hwmon-add-fan-pwm-driver-for-corsair-h100i-platinum/20200717-201923
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> config: xtensa-randconfig-r011-20200719 (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=xtensa
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "usb_deregister" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_register_driver" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_put_dev" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_put_intf" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_get_intf" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_get_dev" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_find_common_endpoints" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_control_msg" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_autopm_put_interface" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_autopm_get_interface" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
> >> ERROR: modpost: "usb_bulk_msg" [drivers/hwmon/corsair_hydro_i_pro.ko] undefined!
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
