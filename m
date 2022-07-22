Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F972C43334
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Jul 2022 00:01:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbiGVABq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Jul 2022 20:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233314AbiGVABp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Jul 2022 20:01:45 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1D318374
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Jul 2022 17:01:44 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id r186so3096642pgr.2
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Jul 2022 17:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A6hBqNa5oaCW/62n3TTH1Yo2p2HS/SNhFYaTKYlyFYA=;
        b=IGl4iiAE94DYdM9NFMivs1JglWWD6HxobDllWCI1GKvzQDWBlH+i9sPHcQGy+RWXdu
         UcuCI3amigyAQUChqrwZu2WdCQ6pXXaZnYRoC0haRJloV1w66lH73wLgtPRDRF9cUclD
         pQMsS7q6CeCZYeoOJTc9/3Qdg3YXivrq8lAcCrPKfYgvQkxesFWqpcJp7tVUdCZXRbYn
         v47gc+8s0tkorCLiUVdnCeWpk8LthtYfmRKN/8R7aeSD7UW4ufIoRU9DvMlitSx1YN9S
         b6aTdvDAPDM32HmG84gnQ0FrffJEiN0u+9DoxcBNbkM9VWF+PLpwo3eYsXhqpicq1LZl
         7UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=A6hBqNa5oaCW/62n3TTH1Yo2p2HS/SNhFYaTKYlyFYA=;
        b=YhIodhfIvJj2EwmwYX0YXGsS2940WPqaqvqSy3Vh0EH4RokCeMO62ZsbbVLiWf31Ck
         34hnkszXLT5967XduJmwx8PFLUqaEgQsXKdWKJ5Cn8uNuCuVKFPKQr4ilplmyuKfeOYY
         yOxaN7+h86KCyXK5RuX1TMY2/Bkfrcdpo2vL3vSgRFm3G6zEheU5kqCqvnKhCcB+lmRx
         27j9gPTsARUMaWKL/YeqvhNQsclUcFkTb7uUwFO3P0OeE15jGNDpnDOYRGhwa6TJz7OF
         WeWUcQ1Cm8wgBsIP6sCUTZi/79yU5Q9yJ/1aMlKV4Iba7Xk0/zpFUavVljGatUvnraVs
         4Miw==
X-Gm-Message-State: AJIora+tjrpGBSul6wf49aKfBZztVp8HL7A7A+FToR+HD2kzCS9nt8s6
        CBCLvyd47eJwZiTZ+CyPi6rLj4dB3CobaA==
X-Google-Smtp-Source: AGRyM1v8y5K0Pf6/8Da0Cw4NvNyTzRbnOMP9+wovtyX8fpeQZgnfQG2qcu6PZfdCCY6Tb5NWMi6CXA==
X-Received: by 2002:a63:8542:0:b0:415:3194:cc76 with SMTP id u63-20020a638542000000b004153194cc76mr746524pgd.431.1658448103742;
        Thu, 21 Jul 2022 17:01:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902d50f00b0016bc947c5b7sm2288529plg.38.2022.07.21.17.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 17:01:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6c0970c-6b0a-5f6c-df56-45fee51eef50@roeck-us.net>
Date:   Thu, 21 Jul 2022 17:01:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [groeck-staging:hwmon-next 77/79]
 drivers/hwmon/tps23861.c:159:19: sparse: sparse: cast to restricted __le16
Content-Language: en-US
To:     "Alex G." <mr.nuke.me@gmail.com>, kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org
References: <202207211843.3aLaNmh9-lkp@intel.com>
 <50fbce6d-32a0-4751-dd2d-a3676b32be02@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <50fbce6d-32a0-4751-dd2d-a3676b32be02@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/21/22 15:03, Alex G. wrote:
> Hi Guenter,
> 
> On 7/21/22 05:41, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
>> head:   5668b5e6cffd975632ee6c32802d7d877b98e9a4
>> commit: 7024d59f146ea99d95b7f238e9991f32f31496b0 [77/79] hwmon: (tps23861) fix byte order in current and voltage registers
>> config: alpha-randconfig-s053-20220720 (https://download.01.org/0day-ci/archive/20220721/202207211843.3aLaNmh9-lkp@intel.com/config)
>> compiler: alpha-linux-gcc (GCC) 12.1.0
>> reproduce:
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # apt-get install sparse
>>          # sparse version: v0.6.4-39-gce1a6720-dirty
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=7024d59f146ea99d95b7f238e9991f32f31496b0
>>          git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>>          git fetch --no-tags groeck-staging hwmon-next
>>          git checkout 7024d59f146ea99d95b7f238e9991f32f31496b0
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/hwmon/
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/hwmon/tps23861.c:159:19: sparse: sparse: cast to restricted __le16
>>     drivers/hwmon/tps23861.c:184:19: sparse: sparse: cast to restricted __le16
> 
> I'm sorry about this. These warnings caught me by surprise. I checked that changing the type from "uint16_t" to "__le16" silences sparse. It
> feels like a false positive. Should I worry about this?
> 

It is not a false positive. Those warnings and variable types exist for a reason.
No worries, though, I already fixed it up.

Guenter
