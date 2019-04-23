Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509A6C10F03
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 20:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 125F4205C9
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 20:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wt0gt1xU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfDWU4p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 16:56:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40343 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfDWU4p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 16:56:45 -0400
Received: by mail-pl1-f196.google.com with SMTP id b3so8108752plr.7
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 13:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CykXfiDApnDZucaQmJy7hqxFFcjIfumMkVl360hSj+s=;
        b=Wt0gt1xU+8GNWUXYkhj0SLV5ajCmOK8FtG017/CmCxoE4/OyfmNs4cSrKyBEBedt0N
         pzTZnUkGFV3pD45hbbQBREWSbmPMAvD6DlM5FGBbF3Y79Rz3/2gx8r6UTs2+snQxUn5s
         xw/juIeRbHo36GND+xo71pIMCv/wxNR9USs4MVas+fxeHmkyzpaybvUAIncXO2Um4+pe
         XtaNVoWzrhOa6i6RByb1KDEsE+fItF4qHeF26jOk8qAF1VknpN+naqAlrWAccYfwO+BY
         voMRg/sJzwJgYiwYitmZTGPEPh2fAMb9PHrLU8OFy5EEy8A4orJexDmTbqnFACWP9D3s
         cL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=CykXfiDApnDZucaQmJy7hqxFFcjIfumMkVl360hSj+s=;
        b=mwNM5NhV/4Z6fv78VpUDGxzXEEjHwbfOFCEKcsEDLS1muvMZsVFnDZv/GNsZdlVmfO
         7kou0kN/8o66eHHKaJpy1fiKwMHnogiQG4IM//4LDIdi+WmhaPMJAf5Zy16DBKLeeFhW
         Ft4ZiQT1Lzewf7u2AgiqYgSW0dAQu6DHrfLE2jwcDLZJq9L+fBCab25rWHmNidVvfUmF
         rD+pCC8cLTr/j1phbuDu4LAjEAuyzcsqbzSDu0n39nakSveSFFgeEtvzDoQKyiLkUrIx
         N1B4LIlyQz8gZy3mK2fbZLV5r0+P6BjFVtin2zp5nnrauxPA7Elp7pn6p5pDi4i4mewT
         2t6A==
X-Gm-Message-State: APjAAAXhU6UE3wd7udxU7QxT4D8YdaseYfZfAoMcPkIwR9Cv7FvG7zHu
        23nJ+Dwgl8ivYk9vTnAYd3DgE9uu
X-Google-Smtp-Source: APXvYqyUCTPOqJ3R3qEWUCqrMOkLcmJf6viCzM/eDHIleY4aHPEMV6Hqo7eFTHeq9zUcA8A8GUt28w==
X-Received: by 2002:a17:902:9302:: with SMTP id bc2mr11998544plb.108.1556053004216;
        Tue, 23 Apr 2019 13:56:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i10sm38629134pfj.7.2019.04.23.13.56.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 13:56:42 -0700 (PDT)
Date:   Tue, 23 Apr 2019 13:56:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Julia Lawall <julia.lawall@lip6.fr>
Cc:     linux-hwmon@vger.kernel.org, kbuild-all@01.org
Subject: Re: [hwmon:hwmon-playground 130/134]
 drivers/hwmon/max6650.c:632:4-10: preceding lock on line 616 (fwd)
Message-ID: <20190423205641.GA30821@roeck-us.net>
References: <alpine.DEB.2.21.1904232208420.2470@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1904232208420.2470@hadrien>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 23, 2019 at 10:09:45PM +0200, Julia Lawall wrote:
> Hello,
> 
> It looks like a goto may be wanted on line 632.
> 
Looks like it ..

Thanks!

Guenter

> julia
> 
> ---------- Forwarded message ----------
> Date: Wed, 24 Apr 2019 03:38:39 +0800
> From: kbuild test robot <lkp@intel.com>
> To: kbuild@01.org
> Cc: Julia Lawall <julia.lawall@lip6.fr>
> Subject: [hwmon:hwmon-playground 130/134] drivers/hwmon/max6650.c:632:4-10:
>     preceding lock on line 616
> 
> CC: kbuild-all@01.org
> CC: linux-hwmon@vger.kernel.org
> TO: Guenter Roeck <linux@roeck-us.net>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-playground
> head:   05d763050bbaa40daa4b60a3912c9311ca5791a5
> commit: 77d270a1d4db919db0b02fec1d85ad5a57d556d7 [130/134] hwmon: (max6650) Convert to use devm_hwmon_device_register_with_info
> :::::: branch date: 6 hours ago
> :::::: commit date: 6 hours ago
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> 
> >> drivers/hwmon/max6650.c:632:4-10: preceding lock on line 616
> 
> # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=77d270a1d4db919db0b02fec1d85ad5a57d556d7
> git remote add hwmon https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
> git remote update hwmon
> git checkout 77d270a1d4db919db0b02fec1d85ad5a57d556d7
> vim +632 drivers/hwmon/max6650.c
> 
> 77d270a1d Guenter Roeck 2019-04-20  608
> 77d270a1d Guenter Roeck 2019-04-20  609  static int max6650_write(struct device *dev, enum hwmon_sensor_types type,
> 77d270a1d Guenter Roeck 2019-04-20  610  			 u32 attr, int channel, long val)
> 77d270a1d Guenter Roeck 2019-04-20  611  {
> 77d270a1d Guenter Roeck 2019-04-20  612  	struct max6650_data *data = dev_get_drvdata(dev);
> 77d270a1d Guenter Roeck 2019-04-20  613  	int ret = 0;
> 77d270a1d Guenter Roeck 2019-04-20  614  	u8 reg;
> 77d270a1d Guenter Roeck 2019-04-20  615
> 77d270a1d Guenter Roeck 2019-04-20 @616  	mutex_lock(&data->update_lock);
> 77d270a1d Guenter Roeck 2019-04-20  617
> 77d270a1d Guenter Roeck 2019-04-20  618  	switch (type) {
> 77d270a1d Guenter Roeck 2019-04-20  619  	case hwmon_pwm:
> 77d270a1d Guenter Roeck 2019-04-20  620  		switch (attr) {
> 77d270a1d Guenter Roeck 2019-04-20  621  		case hwmon_pwm_input:
> 77d270a1d Guenter Roeck 2019-04-20  622  			reg = pwm_to_dac(clamp_val(val, 0, 255),
> 77d270a1d Guenter Roeck 2019-04-20  623  					 data->config & MAX6650_CFG_V12);
> 77d270a1d Guenter Roeck 2019-04-20  624  			ret = i2c_smbus_write_byte_data(data->client,
> 77d270a1d Guenter Roeck 2019-04-20  625  							MAX6650_REG_DAC, reg);
> 77d270a1d Guenter Roeck 2019-04-20  626  			if (ret)
> 77d270a1d Guenter Roeck 2019-04-20  627  				break;
> 77d270a1d Guenter Roeck 2019-04-20  628  			data->dac = reg;
> 77d270a1d Guenter Roeck 2019-04-20  629  			break;
> 77d270a1d Guenter Roeck 2019-04-20  630  		case hwmon_pwm_enable:
> 77d270a1d Guenter Roeck 2019-04-20  631  			if (val < 0 || val >= ARRAY_SIZE(max6650_pwm_modes))
> 77d270a1d Guenter Roeck 2019-04-20 @632  				return -EINVAL;
> 77d270a1d Guenter Roeck 2019-04-20  633  			ret = max6650_set_operating_mode(data,
> 77d270a1d Guenter Roeck 2019-04-20  634  						max6650_pwm_modes[val]);
> 77d270a1d Guenter Roeck 2019-04-20  635  			break;
> 77d270a1d Guenter Roeck 2019-04-20  636  		default:
> 77d270a1d Guenter Roeck 2019-04-20  637  			ret = -EOPNOTSUPP;
> 77d270a1d Guenter Roeck 2019-04-20  638  			break;
> 77d270a1d Guenter Roeck 2019-04-20  639  		}
> 77d270a1d Guenter Roeck 2019-04-20  640  	case hwmon_fan:
> 77d270a1d Guenter Roeck 2019-04-20  641  		switch (attr) {
> 77d270a1d Guenter Roeck 2019-04-20  642  		case hwmon_fan_div:
> 77d270a1d Guenter Roeck 2019-04-20  643  			switch (val) {
> 77d270a1d Guenter Roeck 2019-04-20  644  			case 1:
> 77d270a1d Guenter Roeck 2019-04-20  645  				reg = 0;
> 77d270a1d Guenter Roeck 2019-04-20  646  				break;
> 77d270a1d Guenter Roeck 2019-04-20  647  			case 2:
> 77d270a1d Guenter Roeck 2019-04-20  648  				reg = 1;
> 77d270a1d Guenter Roeck 2019-04-20  649  				break;
> 77d270a1d Guenter Roeck 2019-04-20  650  			case 4:
> 77d270a1d Guenter Roeck 2019-04-20  651  				reg = 2;
> 77d270a1d Guenter Roeck 2019-04-20  652  				break;
> 77d270a1d Guenter Roeck 2019-04-20  653  			case 8:
> 77d270a1d Guenter Roeck 2019-04-20  654  				reg = 3;
> 77d270a1d Guenter Roeck 2019-04-20  655  				break;
> 77d270a1d Guenter Roeck 2019-04-20  656  			default:
> 77d270a1d Guenter Roeck 2019-04-20  657  				ret = -EINVAL;
> 77d270a1d Guenter Roeck 2019-04-20  658  				goto error;
> 77d270a1d Guenter Roeck 2019-04-20  659  			}
> 77d270a1d Guenter Roeck 2019-04-20  660  			ret = i2c_smbus_write_byte_data(data->client,
> 77d270a1d Guenter Roeck 2019-04-20  661  							MAX6650_REG_COUNT, reg);
> 77d270a1d Guenter Roeck 2019-04-20  662  			if (ret)
> 77d270a1d Guenter Roeck 2019-04-20  663  				break;
> 77d270a1d Guenter Roeck 2019-04-20  664  			data->count = reg;
> 77d270a1d Guenter Roeck 2019-04-20  665  			break;
> 77d270a1d Guenter Roeck 2019-04-20  666  		case hwmon_fan_target:
> 77d270a1d Guenter Roeck 2019-04-20  667  			if (val < 0) {
> 77d270a1d Guenter Roeck 2019-04-20  668  				ret = -EINVAL;
> 77d270a1d Guenter Roeck 2019-04-20  669  				break;
> 77d270a1d Guenter Roeck 2019-04-20  670  			}
> 77d270a1d Guenter Roeck 2019-04-20  671  			ret = max6650_set_target(data, val);
> 77d270a1d Guenter Roeck 2019-04-20  672  			break;
> 77d270a1d Guenter Roeck 2019-04-20  673  		default:
> 77d270a1d Guenter Roeck 2019-04-20  674  			ret = -EOPNOTSUPP;
> 77d270a1d Guenter Roeck 2019-04-20  675  			break;
> 77d270a1d Guenter Roeck 2019-04-20  676  		}
> 77d270a1d Guenter Roeck 2019-04-20  677  		break;
> 77d270a1d Guenter Roeck 2019-04-20  678  	default:
> 77d270a1d Guenter Roeck 2019-04-20  679  		ret = -EOPNOTSUPP;
> 77d270a1d Guenter Roeck 2019-04-20  680  		break;
> 77d270a1d Guenter Roeck 2019-04-20  681  	}
> 77d270a1d Guenter Roeck 2019-04-20  682
> 77d270a1d Guenter Roeck 2019-04-20  683  error:
> 77d270a1d Guenter Roeck 2019-04-20  684  	mutex_unlock(&data->update_lock);
> 77d270a1d Guenter Roeck 2019-04-20  685  	return ret;
> 77d270a1d Guenter Roeck 2019-04-20  686  }
> 77d270a1d Guenter Roeck 2019-04-20  687
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
