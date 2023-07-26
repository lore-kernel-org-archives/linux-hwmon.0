Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015CFC001DE
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Jul 2023 23:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjGZXxj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Jul 2023 19:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjGZXxi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Jul 2023 19:53:38 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EF8AA;
        Wed, 26 Jul 2023 16:53:37 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2683add3662so281893a91.1;
        Wed, 26 Jul 2023 16:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690415617; x=1691020417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NRyGMlHg9fFAepKXgOzg271kQtVxYUgZIbTQ9lTP6NY=;
        b=kcU/e5pFPS9y31sgQTgN08WUZfesShj2GqSEle0SCoWqdkhc7YUOJtOKdLhRlJdguK
         Kg51Q1W0ynLcNxX8sjoXQwEq09CgOYc3roQbSzDEJDOD87TLyDaS7dmarlV3JnRtaSnc
         iqJEvUHvgyYq9mQd0L/m62HTZkFmtby/dPmuYX2i1BVjZyZxrPBV/8EzKdyYscLJ/ehW
         clrlrF41NDR11L30O8IJomqwl068TuGk32n21SLibFj3JN/Dmz8j12H71ZScudMmPbnf
         rQDgdwZ6BWppAGA49tUceBhP84L2RcQqMBpR5Uzr7sZHQyahKcYiNx286ylU/lxMZko7
         2uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690415617; x=1691020417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRyGMlHg9fFAepKXgOzg271kQtVxYUgZIbTQ9lTP6NY=;
        b=j+aL6minmB4LAzWe/LT6eq1kpcQes3vBdpZ+/Qk1O/GmI78WaWzbuozpDea7XdVrWZ
         TC5KOSheGPW/2Q4uCuVgt5RlP4xPWfaLTcmCphwbTMmtgd3d5X/y2aCl/vlSrxpcYYUi
         OwAQDbDVNfxZgJJ5EkRS7/zeAEI14G+DLcAN+/xKfyGBXvzkcX26rqWhLLrG+alFMpOa
         ti2Qoucvop3/F4gPVaOuMoOluodfDZNtpjsGpCUP3lVKs1xVjknB0y7uVMwqC6qbrltH
         Wn+tgme7sTKFph0qNL9PfbygaFZm5eMNlkB1qwVFaGzkxXu5FhMQeLFzNWY0hDT1lRAr
         Q1Ig==
X-Gm-Message-State: ABy/qLYu2dAFlIySqFHGLbxfzMZQAaVuKXQtVYZu4uodSKKiQNrjHHMy
        GKELM2OXdqZi4M/dnlSJg8cbKv+K0hk=
X-Google-Smtp-Source: APBJJlGO7XI1TFSDP3DUo347+WApNWEmMsvb6JH5QETEM2KOi/mude959dCNNT9+edQ0H6fNew6wBw==
X-Received: by 2002:a17:90b:4b8f:b0:261:2a59:dc38 with SMTP id lr15-20020a17090b4b8f00b002612a59dc38mr3614225pjb.25.1690415617026;
        Wed, 26 Jul 2023 16:53:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ep11-20020a17090ae64b00b00262eccfa29fsm1711028pjb.33.2023.07.26.16.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 16:53:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f67f7165-bad6-3e77-2ec1-f9c37eb3ac0d@roeck-us.net>
Date:   Wed, 26 Jul 2023 16:53:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [groeck-staging:hwmon-next 35/36] htmldocs:
 Documentation/hwmon/hs3001.rst:4: WARNING: Title underline too short.
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        Andre Werner <andre.werner@systec-electronic.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <202307270449.YQ4vCUwO-lkp@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <202307270449.YQ4vCUwO-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/26/23 13:39, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   c944c8c532f7bd6d9e52ee3e2e97dcdd9c6014c0
> commit: 33faa6fcc93f78e6b0e9b5aaf986446ac3c34047 [35/36] hwmon: Add driver for Renesas HS3001
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270449.YQ4vCUwO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307270449.YQ4vCUwO-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> Documentation/hwmon/hs3001.rst:4: WARNING: Title underline too short.
>>> Documentation/hwmon/hs3001.rst:34: WARNING: Missing matching underline for section title overline.
> 

Andre - no need to send a fix. I fixed it up.

Guenter

> vim +4 Documentation/hwmon/hs3001.rst
> 
>       2	
>       3	Kernel driver HS3001
>     > 4	===================
>       5	
>       6	Supported chips:
>       7	
>       8	  * Renesas HS3001, HS3002, HS3003, HS3004
>       9	
>      10	    Prefix: 'hs3001'
>      11	
>      12	    Addresses scanned: -
>      13	
>      14	    Datasheet: https://www.renesas.com/us/en/document/dst/hs300x-datasheet?r=417401
>      15	
>      16	Author:
>      17	
>      18	  - Andre Werner <andre.werner@systec-electronic.com>
>      19	
>      20	Description
>      21	-----------
>      22	
>      23	This driver implements support for the Renesas HS3001 chips, a humidity
>      24	and temperature family. Temperature is measured in degrees celsius, relative
>      25	humidity is expressed as a percentage. In the sysfs interface, all values are
>      26	scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
>      27	
>      28	The device communicates with the I2C protocol. Sensors have the I2C
>      29	address 0x44 by default.
>      30	
>      31	sysfs-Interface
>      32	---------------
>      33	
>    > 34	===============================================================================
> 

