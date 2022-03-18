Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AEFC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Mar 2022 14:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbiCRO75 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Mar 2022 10:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237491AbiCRO7y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Mar 2022 10:59:54 -0400
X-Greylist: delayed 1447 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Mar 2022 07:58:34 PDT
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com [192.185.60.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9EAB1A8B
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Mar 2022 07:58:32 -0700 (PDT)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 015A7400D4542
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Mar 2022 09:34:25 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id VDeSnJlz3HnotVDeSnTA7m; Fri, 18 Mar 2022 09:32:24 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xJSeFXEv0MsCLMmIo+zvVtrl7PN3UrB1l3mugyJKHT8=; b=zDm9kuwnQlobpoDtn2XNjkBuPZ
        hUW1s395q3X7TtFciXA0KaKMOC09DkwYKrt1mI8zX9Ngk6dPNp22n0S7xnXHA2ST9ydFJcMRaxrR+
        qw9B1LLQ0fvW6PlUlkvcLR60xIbZ9xVRfLs1CsaNLxAi3wVEoC/64XfwWsue19hkCThxEyV0hxf86
        NeK6hrcmkhB8cQz3CndoVI+/XAARVzugXiaz46L2j9IJX88NIM+bhHdyVgx79nnqdELWHpTsRIdBb
        VLcjqKgSa5NitiU6P4xhT7hpVnA0pSHlY9/CDqC+cBtpvJ7ZVRn5/mAIXm/3Zd1AMZCQtgIY0ZJf9
        kjCt9Fqw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57538 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nVDeS-003Wqy-Am; Fri, 18 Mar 2022 14:32:24 +0000
Date:   Fri, 18 Mar 2022 07:32:23 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (adt7475) Use enum chips when loading
 attenuator settings
Message-ID: <20220318143223.GA673001@roeck-us.net>
References: <20220317223051.1227110-1-chris.packham@alliedtelesis.co.nz>
 <20220317223051.1227110-4-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317223051.1227110-4-chris.packham@alliedtelesis.co.nz>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nVDeS-003Wqy-Am
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57538
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Mar 18, 2022 at 11:30:50AM +1300, Chris Packham wrote:
> Simplify load_attenuators() by making use of enum chips instead of int.
> 

That isn't the only thing the patch is doing.

> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes in v2:
>     - New
> 
>  drivers/hwmon/adt7475.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 6de501de41b2..ebe4a85eb62e 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -1569,7 +1569,7 @@ static int set_property_bit(const struct i2c_client *client, char *property,
>  	return ret;
>  }
>  
> -static int load_attenuators(const struct i2c_client *client, int chip,
> +static int load_attenuators(const struct i2c_client *client, enum chips chip,
>  			    struct adt7475_data *data)
>  {
>  	int ret;
> @@ -1588,7 +1588,7 @@ static int load_attenuators(const struct i2c_client *client, int chip,
>  						data->config4);
>  		if (ret < 0)
>  			return ret;
> -	} else if (chip == adt7473 || chip == adt7475) {
> +	} else {

This is the real change. Well, in theory. It doesn't really make a difference,
it is just (currently) unnecessary but clarifies that the following code only
applies to the two chips. It may be better to replace the if/else with a switch
statement to clarify this. Dropping the conditional would not require to change
the parameter type. That only really adds value if you also use a switch
statement (without dummy default).

Thanks,
Guenter

>  		set_property_bit(client, "adi,bypass-attenuator-in1",
>  				 &data->config2, 5);
>  
