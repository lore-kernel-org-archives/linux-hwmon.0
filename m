Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A490C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Mar 2022 01:21:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbiCKBWh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Mar 2022 20:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240140AbiCKBWf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Mar 2022 20:22:35 -0500
X-Greylist: delayed 1283 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Mar 2022 17:21:33 PST
Received: from gateway23.websitewelcome.com (gateway23.websitewelcome.com [192.185.48.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD827F65DC
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Mar 2022 17:21:33 -0800 (PST)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 2D20941E3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Mar 2022 19:00:10 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id STdancOV8HnotSTdanxzBG; Thu, 10 Mar 2022 19:00:10 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YrYcmX1/YLKPFplyGX4juPlh6LZE8D01pZWFuhgPaPo=; b=bfXiwVit+FdkOiMo8rqatyjIx5
        Hj+itje0sHNCV089kohxPRKB7bSSNrl3ChZ/+Mi8vVmUl7MKyJNdLxUDx/qSqIXzfYHK8EBACrmuQ
        ubvMIz3c3SdJuC5onEYF6cOzSuEBewaqTwz4+oqH8ta+DuKKGk9BZDuW/yWskAcpJNb3wA+BTSAkz
        BKKn0ha2ou57FBO9SFksMjms5ebQEp54rSVId7eBqMq647syMiFIIbSLdCViRLwC+3i1UvxNMj1Ie
        k2fyl1rYlbLOXi+rUIbQnYR3403exhCZSMX0S1jwCluUoiPaPSdYUssldDpyVjYdSyZ+9G8Kaoz4Q
        7UdPFSlw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54240)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nSTdZ-001lMl-KX; Fri, 11 Mar 2022 01:00:09 +0000
Message-ID: <3602c1b2-1335-0663-c96a-c524c555ccc9@roeck-us.net>
Date:   Thu, 10 Mar 2022 17:00:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Add clear_faults debugfs entry
Content-Language: en-US
To:     Brandon Wyman <bjwyman@gmail.com>, Joel Stanley <joel@jms.id.au>,
        openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220311001858.4166205-1-bjwyman@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220311001858.4166205-1-bjwyman@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nSTdZ-001lMl-KX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54240
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/10/22 16:18, Brandon Wyman wrote:
> Add a clear_faults write-only debugfs entry for the ibm-cffps device
> driver.
> 

This does not explain _why_ this would be needed.

Guenter

> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
> ---
>   drivers/hwmon/pmbus/ibm-cffps.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index e3294a1a54bb..fca2642a8ed4 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -67,6 +67,7 @@ enum {
>   	CFFPS_DEBUGFS_CCIN,
>   	CFFPS_DEBUGFS_FW,
>   	CFFPS_DEBUGFS_ON_OFF_CONFIG,
> +	CFFPS_DEBUGFS_CLEAR_FAULTS,
>   	CFFPS_DEBUGFS_NUM_ENTRIES
>   };
>   
> @@ -274,6 +275,13 @@ static ssize_t ibm_cffps_debugfs_write(struct file *file,
>   		if (rc)
>   			return rc;
>   
> +		rc = 1;
> +		break;
> +	case CFFPS_DEBUGFS_CLEAR_FAULTS:
> +		rc = i2c_smbus_write_byte(psu->client, PMBUS_CLEAR_FAULTS);
> +		if (rc < 0)
> +			return rc;
> +
>   		rc = 1;
>   		break;
>   	default:
> @@ -607,6 +615,9 @@ static int ibm_cffps_probe(struct i2c_client *client)
>   	debugfs_create_file("on_off_config", 0644, ibm_cffps_dir,
>   			    &psu->debugfs_entries[CFFPS_DEBUGFS_ON_OFF_CONFIG],
>   			    &ibm_cffps_fops);
> +	debugfs_create_file("clear_faults", 0200, ibm_cffps_dir,
> +			    &psu->debugfs_entries[CFFPS_DEBUGFS_CLEAR_FAULTS],
> +			    &ibm_cffps_fops);
>   
>   	return 0;
>   }

