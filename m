Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFF5C43334
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Jul 2022 22:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbiGUWDG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Jul 2022 18:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233557AbiGUWDF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Jul 2022 18:03:05 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B01951C7
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Jul 2022 15:03:04 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-10d9137bd2eso4289076fac.3
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Jul 2022 15:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=u1XTPRVRUntuXnw9leTQM07wrvuLMd2JFsVMZ/fnQ70=;
        b=VmXu2ed5Wg3my9nxApkO9Qie98MZpYwiiKIpuh3L7CidUpH0d7r7fdEqLl0EVIm8xF
         fE9C77qiWoy7g18Q7Qsqn+Ls/J86nNDmwAS08CFEOKtfgXSX/1K+ylv+/WyuJN+YQ/de
         d9obCE0A1VaMfy8xIUWan/UIwIhUsT9uqenVoxSavSM4dMxH2qgiEgli7KVFgid5jTsF
         FWyyjL3zbCVUrlBXtdYbk55R66ACXcbUAEAc6yUiOHXXqb+yZvEgHIhMajfwAKCuc1J2
         OrJ9Nq94guZM+vJhA10XWNvYAQi4gYhDJyHQr6/rfvvlltA5oGgXIhujEEXAudri0IO6
         yILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=u1XTPRVRUntuXnw9leTQM07wrvuLMd2JFsVMZ/fnQ70=;
        b=euZvsx+llG4xJ799N/WNBQMpdWpKNTTWUGzyRVx+0PzvMNSHYvYlos8p3cKdkXaa8c
         PwHOjYovqLna31SC0RTd9hlI5Z+uMREpQgST9JZWxh40i3kwR/hfUw0cv1I1mLjUpYtg
         fT5uDSDNo1yroyvkC4juLWE2GXlhtdYCisnhUxyywB5j/u1s/YkZ8yr0OYX443wFFOs+
         ZSJVIw2z/EXwBOrGsJT0++TBeQ9uOaO6aIXqQ4nivWJPfMjfDboHuqE78kNYWGHYbzNe
         J4PXjtO1z2UTqeUPtkB/4IkPwxqgWDaW5Ud0YEnzaF4MBGqtUe3oKWM4+iSF/xcnWXMV
         tCig==
X-Gm-Message-State: AJIora9zR+uOVi91DgboSEo/n8cKooHuoFTXhuWJtZcrZYqdsv0AeUPR
        yOIpwS4YAhQF7hINBOi1TJXs6ldiDvo=
X-Google-Smtp-Source: AGRyM1u+UpfScNhN07HxHDFP+m/0GWubPEYOvmd6g1Y9jTHTxH8ISqvTEUv6AWZc6uUiCmmQMNeEpA==
X-Received: by 2002:a05:6870:3487:b0:10c:baa4:b925 with SMTP id n7-20020a056870348700b0010cbaa4b925mr192953oah.285.1658440983226;
        Thu, 21 Jul 2022 15:03:03 -0700 (PDT)
Received: from [192.168.1.169] (c-98-197-59-62.hsd1.tx.comcast.net. [98.197.59.62])
        by smtp.gmail.com with ESMTPSA id z16-20020a4ad590000000b004354d726305sm1264107oos.8.2022.07.21.15.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 15:03:02 -0700 (PDT)
Message-ID: <50fbce6d-32a0-4751-dd2d-a3676b32be02@gmail.com>
Date:   Thu, 21 Jul 2022 17:03:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [groeck-staging:hwmon-next 77/79]
 drivers/hwmon/tps23861.c:159:19: sparse: sparse: cast to restricted __le16
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
References: <202207211843.3aLaNmh9-lkp@intel.com>
From:   "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <202207211843.3aLaNmh9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 7/21/22 05:41, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   5668b5e6cffd975632ee6c32802d7d877b98e9a4
> commit: 7024d59f146ea99d95b7f238e9991f32f31496b0 [77/79] hwmon: (tps23861) fix byte order in current and voltage registers
> config: alpha-randconfig-s053-20220720 (https://download.01.org/0day-ci/archive/20220721/202207211843.3aLaNmh9-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 12.1.0
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # apt-get install sparse
>          # sparse version: v0.6.4-39-gce1a6720-dirty
>          # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=7024d59f146ea99d95b7f238e9991f32f31496b0
>          git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>          git fetch --no-tags groeck-staging hwmon-next
>          git checkout 7024d59f146ea99d95b7f238e9991f32f31496b0
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/hwmon/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> 
> sparse warnings: (new ones prefixed by >>)
>>> drivers/hwmon/tps23861.c:159:19: sparse: sparse: cast to restricted __le16
>     drivers/hwmon/tps23861.c:184:19: sparse: sparse: cast to restricted __le16

I'm sorry about this. These warnings caught me by surprise. I checked 
that changing the type from "uint16_t" to "__le16" silences sparse. It
feels like a false positive. Should I worry about this?

Alex

> vim +159 drivers/hwmon/tps23861.c
> 
>     139	
>     140	static int tps23861_read_voltage(struct tps23861_data *data, int channel,
>     141					 long *val)
>     142	{
>     143		uint16_t regval;
>     144		long raw_val;
>     145		int err;
>     146	
>     147		if (channel < TPS23861_NUM_PORTS) {
>     148			err = regmap_bulk_read(data->regmap,
>     149					       PORT_1_VOLTAGE_LSB + channel * PORT_N_VOLTAGE_LSB_OFFSET,
>     150					       &regval, 2);
>     151		} else {
>     152			err = regmap_bulk_read(data->regmap,
>     153					       INPUT_VOLTAGE_LSB,
>     154					       &regval, 2);
>     155		}
>     156		if (err < 0)
>     157			return err;
>     158	
>   > 159		raw_val = le16_to_cpu(regval);
>     160		*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, raw_val) * VOLTAGE_LSB) / 1000;
>     161	
>     162		return 0;
>     163	}
>     164	
> 
