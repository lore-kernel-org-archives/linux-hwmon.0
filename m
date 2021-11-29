Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C5CC433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 29 Nov 2021 14:02:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244687AbhK2OFb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 29 Nov 2021 09:05:31 -0500
Received: from cpanel.siel.si ([46.19.9.99]:51550 "EHLO cpanel.siel.si"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244190AbhK2ODb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Nov 2021 09:03:31 -0500
X-Greylist: delayed 2361 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Nov 2021 09:03:30 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=6rQeqm1gf5TyoLBH5qU0ilKudxmiHViF98acqSq9ssY=; b=Cea/k2TirYunprZoGUKfFUfRAn
        E13DUFonSUQOINQK9cVl+Fe6ZxPeAvemm34HsS0SxWEiWL0Bid+4e4sL1JA7r+iiDw4jfbe2sK2h1
        //Vtg7NlwnEb3M3etMyfm4e0RsNEO2R+yn6lXaDlg6wQdFd4JLixEs1PgkEI9DFgnb2HTHvq7qfkz
        xoPplwtAKfDP5ND4shCvmWjbziF2jCB9CLSc4N/yOxeJsW5t0MrEFOqrGY2p6F58QsptIpfYJHLM7
        9DcuLh9HJaB12Mwidq5/E+MdT/+wZYMCtBXdRnryY5j/OopFzGzQH2WFt8cEQz4u6Ua1yoVDTbi8N
        5F13UBzA==;
Received: from [89.212.21.243] (port=60946 helo=[192.168.69.215])
        by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <andrej.picej@norik.com>)
        id 1mrgaL-00FHBt-Ef; Mon, 29 Nov 2021 14:20:45 +0100
Subject: Re: [groeck-staging:watchdog-next 25/28]
 drivers/watchdog/da9063_wdt.c:177:15: error: implicit declaration of function
 'i2c_smbus_write_byte_data'
To:     kernel test robot <lkp@intel.com>, Yunus Bas <y.bas@phytec.de>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
References: <202111292050.cwhXdxtQ-lkp@intel.com>
From:   Andrej Picej <andrej.picej@norik.com>
Message-ID: <46440ccf-edb9-3d35-aae0-72e60278e650@norik.com>
Date:   Mon, 29 Nov 2021 14:20:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <202111292050.cwhXdxtQ-lkp@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

On 29. 11. 21 13:24, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
> head:   293903b9dfe43520f01374dc1661be11d6838c49
> commit: 5ea29919c29413c984f4ba3e04a6679d306e7a6e [25/28] watchdog: da9063: use atomic safe i2c transfer in reset handler
> config: csky-randconfig-r032-20211128 (https://download.01.org/0day-ci/archive/20211129/202111292050.cwhXdxtQ-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=5ea29919c29413c984f4ba3e04a6679d306e7a6e
>          git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>          git fetch --no-tags groeck-staging watchdog-next
>          git checkout 5ea29919c29413c984f4ba3e04a6679d306e7a6e
>          # save the config file to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=csky SHELL=/bin/bash drivers/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/watchdog/da9063_wdt.c: In function 'da9063_wdt_restart':
>>> drivers/watchdog/da9063_wdt.c:177:15: error: implicit declaration of function 'i2c_smbus_write_byte_data' [-Werror=implicit-function-declaration]
>       177 |         ret = i2c_smbus_write_byte_data(client, DA9063_REG_CONTROL_F,
>           |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
> 
> 
> vim +/i2c_smbus_write_byte_data +177 drivers/watchdog/da9063_wdt.c
> 
>     168	
>     169	static int da9063_wdt_restart(struct watchdog_device *wdd, unsigned long action,
>     170				      void *data)
>     171	{
>     172		struct da9063 *da9063 = watchdog_get_drvdata(wdd);
>     173		struct i2c_client *client = to_i2c_client(da9063->dev);
>     174		int ret;
>     175	
>     176		/* Don't use regmap because it is not atomic safe */
>   > 177		ret = i2c_smbus_write_byte_data(client, DA9063_REG_CONTROL_F,
>     178						DA9063_SHUTDOWN);
>     179		if (ret < 0)
>     180			dev_alert(da9063->dev, "Failed to shutdown (err = %d)\n",
>     181				  ret);
>     182	
>     183		/* wait for reset to assert... */
>     184		mdelay(500);
>     185	
>     186		return ret;
>     187	}
>     188	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

This should be fixed if we add hard dependency to I2C. Just like 
44144c809e39 ("watchdog: da9062: Add dependency on I2C") fixes the 
057b52b4b3d58 ("watchdog: da9062: make restart handler atomic safe") on 
the da9062.

I will create a patch and submit it if that's OK.

Sorry for not noticing this problem before submitting the initial patch.

BR,
Andrej
