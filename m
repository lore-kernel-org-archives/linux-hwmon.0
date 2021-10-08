Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30955C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 23:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 145EC60F11
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 23:20:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhJHXWj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 19:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhJHXWi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 19:22:38 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D959CC061570
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Oct 2021 16:20:42 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id k2-20020a056830168200b0054e523d242aso3958942otr.6
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Oct 2021 16:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Q6eMg9Mg+9jlLglmWzSLt+ONVtAxFLaEMOJKIeoLHnY=;
        b=gJOek333pwRGfS5TLtxEtr1SpS6WJQi76E3eflfeH212TBBHJwswKTgZJN8Klcdprr
         JHh7QgXtcfuC6/SvwxeiVWW0+pkUNlX2L4/rKreNrWhwILW9Zh3Bx1yaivYKFqLp7nti
         XsJf8nWEAuWZ6tzH2oBlrWS9yuNPX6hHRkJSc037xQuN00jiKfBJqTKX+EI5zSbOzxQw
         dF9Voc6fjO8NqLD63BSvKYR++fA8gajGCvB1efQrKzHGvmesFM6ERfCxYd07GAAVsgWa
         Luo0q5fym0EcrRkjj/zeD3esddUEqdHbDMUCXIvhIr5NqH+48J3hdh06gsDQYROpDYwV
         qLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q6eMg9Mg+9jlLglmWzSLt+ONVtAxFLaEMOJKIeoLHnY=;
        b=nwD9Sm/cHCXt8X9gloll1+aY+d4o6f8p0/qtHYLKbOgDM6w4HlB88JjSf0SygqiVxe
         StLYg1RvN0OP0PaSqbQ82MMyzjLIUV8wSeqx88wPXqRX9HdNZVO4qlZCh1GrJ7YEiBtH
         4xlhmd7Zzj58FeI6QnDimlgdkFNsoJD17v31TV62mhHDcLFr9m9LKyrFlIsSkFCnEN9H
         GKQ4O0BF4sXi3thTZRrA/C948Bp0Md7yLGBKnorMTLSBG9bGKjkiZepXoKKyeVqqhRiU
         yPEETWH9Vyuuwzu1dOeT7VupUlU11HM0EGxbw8T/vB1MvLorfng7CmjF34Kx8C273Rog
         B8Yg==
X-Gm-Message-State: AOAM532jZr0QIcBR1EWKMerLlC+QIQzsmsQ7OFM7wBByFeExftzcnpuP
        gWthcIk4yX0jkC1R/y/82E+Rs1TuBuc=
X-Google-Smtp-Source: ABdhPJxqWRVBebcOsOVG13iMOctO/+v6ni6X8xecKURcyRumsefeiyaA9CgptoeROrRKl8yt2mKbAw==
X-Received: by 2002:a05:6830:3151:: with SMTP id c17mr11302881ots.364.1633735241929;
        Fri, 08 Oct 2021 16:20:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f61sm161060otf.73.2021.10.08.16.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 16:20:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [groeck-staging:hwmon-next 33/45]
 drivers/hwmon/pmbus/lm25066.c:483:15: warning: cast to smaller integer type
 'enum chips' from 'const void *'
To:     kernel test robot <lkp@intel.com>,
        Zev Weiss <zev@bewilderbeest.net>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org
References: <202110090604.iPwRzCsh-lkp@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <cfca13fa-9d17-8cbc-e0a4-839a2ca7a1c9@roeck-us.net>
Date:   Fri, 8 Oct 2021 16:20:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <202110090604.iPwRzCsh-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/8/21 3:00 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
> head:   574d7bfb7324c9a11cf6c0e58960022da6eca2f1
> commit: c49bc1bcda2408ec16601b98d981f1d38f947f29 [33/45] hwmon: (pmbus/lm25066) Add OF device ID table
> config: x86_64-randconfig-r001-20211008 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 8ed2e8e04ff42eb4d8009999ae1fd341a30bf6c0)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=c49bc1bcda2408ec16601b98d981f1d38f947f29
>          git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
>          git fetch --no-tags groeck-staging hwmon-next
>          git checkout c49bc1bcda2408ec16601b98d981f1d38f947f29
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/hwmon/pmbus/lm25066.c:483:15: warning: cast to smaller integer type 'enum chips' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>             if (of_id && (enum chips)of_id->data != i2c_id->driver_data)
>                          ^~~~~~~~~~~~~~~~~~~~~~~
>     1 warning generated.
> 
> 
> vim +483 drivers/hwmon/pmbus/lm25066.c
> 
>     457	
>     458	static int lm25066_probe(struct i2c_client *client)
>     459	{
>     460		int config;
>     461		struct lm25066_data *data;
>     462		struct pmbus_driver_info *info;
>     463		const struct __coeff *coeff;
>     464		const struct of_device_id *of_id;
>     465		const struct i2c_device_id *i2c_id;
>     466	
>     467		if (!i2c_check_functionality(client->adapter,
>     468					     I2C_FUNC_SMBUS_READ_BYTE_DATA))
>     469			return -ENODEV;
>     470	
>     471		data = devm_kzalloc(&client->dev, sizeof(struct lm25066_data),
>     472				    GFP_KERNEL);
>     473		if (!data)
>     474			return -ENOMEM;
>     475	
>     476		config = i2c_smbus_read_byte_data(client, LM25066_DEVICE_SETUP);
>     477		if (config < 0)
>     478			return config;
>     479	
>     480		i2c_id = i2c_match_id(lm25066_id, client);
>     481	
>     482		of_id = of_match_device(lm25066_of_match, &client->dev);
>   > 483		if (of_id && (enum chips)of_id->data != i2c_id->driver_data)

Fixed up by replacing typecast with unsigned long.

Guenter

>     484			dev_notice(&client->dev, "Device mismatch: %s in device tree, %s detected\n",
>     485				   of_id->name, i2c_id->name);
>     486	
>     487		data->id = i2c_id->driver_data;
>     488		info = &data->info;
>     489	
>     490		info->pages = 1;
>     491		info->format[PSC_VOLTAGE_IN] = direct;
>     492		info->format[PSC_VOLTAGE_OUT] = direct;
>     493		info->format[PSC_CURRENT_IN] = direct;
>     494		info->format[PSC_TEMPERATURE] = direct;
>     495		info->format[PSC_POWER] = direct;
>     496	
>     497		info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VMON
>     498		  | PMBUS_HAVE_PIN | PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT
>     499		  | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_SAMPLES;
>     500	
>     501		if (data->id == lm25056) {
>     502			info->func[0] |= PMBUS_HAVE_STATUS_VMON;
>     503			info->read_word_data = lm25056_read_word_data;
>     504			info->read_byte_data = lm25056_read_byte_data;
>     505			data->rlimit = 0x0fff;
>     506		} else {
>     507			info->func[0] |= PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
>     508			info->read_word_data = lm25066_read_word_data;
>     509			data->rlimit = 0x0fff;
>     510		}
>     511		info->write_word_data = lm25066_write_word_data;
>     512	
>     513		coeff = &lm25066_coeff[data->id][0];
>     514		info->m[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].m;
>     515		info->b[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].b;
>     516		info->R[PSC_TEMPERATURE] = coeff[PSC_TEMPERATURE].R;
>     517		info->m[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].m;
>     518		info->b[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].b;
>     519		info->R[PSC_VOLTAGE_IN] = coeff[PSC_VOLTAGE_IN].R;
>     520		info->m[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].m;
>     521		info->b[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].b;
>     522		info->R[PSC_VOLTAGE_OUT] = coeff[PSC_VOLTAGE_OUT].R;
>     523		info->R[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].R;
>     524		info->R[PSC_POWER] = coeff[PSC_POWER].R;
>     525		if (config & LM25066_DEV_SETUP_CL) {
>     526			info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].m;
>     527			info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN_L].b;
>     528			info->m[PSC_POWER] = coeff[PSC_POWER_L].m;
>     529			info->b[PSC_POWER] = coeff[PSC_POWER_L].b;
>     530		} else {
>     531			info->m[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].m;
>     532			info->b[PSC_CURRENT_IN] = coeff[PSC_CURRENT_IN].b;
>     533			info->m[PSC_POWER] = coeff[PSC_POWER].m;
>     534			info->b[PSC_POWER] = coeff[PSC_POWER].b;
>     535		}
>     536	
>     537		return pmbus_do_probe(client, info);
>     538	}
>     539	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

