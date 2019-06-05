Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15144C28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 20:57:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE4572067C
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 20:57:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQoDR0P2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfFEU5j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 16:57:39 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46377 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFEU5j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 16:57:39 -0400
Received: by mail-pg1-f193.google.com with SMTP id v9so13048778pgr.13
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2019 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zzlaCjPHLCg/4HFHP/arELhYp7HUtyO85K0CdDCC7Uo=;
        b=fQoDR0P25NrbYbpGV83xzfYVyIVxziqIK6CTMisd6W6F1QEWR2nBh5NM2X58rqKMi/
         Rp6xMMa0HEVDM1t64C2uDBbA+837S5vWeNy6X7MJDfKAksHxQKrH9akUM4I+xmZF8tP3
         T9AGesq+eOj1g5ag0qocMIre4FyJ7f0I8dM/GEV4K1+j3fuwJaihSo0MviqhOUlb1qoH
         5M9Q6/k4cnlDdM3NYuOd7P5uMRLhIksoS/q5vC8qhJFdWVujz1YvVRHMgdMj/itsJPbp
         1D6Nj+0FKbL9fVOrrBQ+S+/NpnAR3Mc+eiK/TcgreBOO3ZpBt9xvZjAO485TVssw9qbZ
         zURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=zzlaCjPHLCg/4HFHP/arELhYp7HUtyO85K0CdDCC7Uo=;
        b=pCYEoEWo6/+BznaN8w26er7XLgMkgrOwdtD2fePztfWS50/mGswjahcCtC3H19OzYz
         8Q29UYZrEHD1bPfz6D4KjByZL7rkbKgM15l0IZBbHSz0CiXSsh+I2P/12MRuiTjvaKXY
         x0pIgPxU8qT/sudlPOQBP1873SxPXqkxxSdMbwZ2PJ0DDV5As5YOhX30G/OtrVm2xVSg
         BJX6KRBGuxM5rRQpjRyuejwKyc93vkpGLTyXC2aiOFcNz2YzCwb4W7XDv0W8/filw+AR
         /YmyTBSmxGdWOEYmUhFAo/XegydxhfN2G/h6e8hgROPmGNiMqZQ0eE8IrK5hHhUjlsVu
         xjxw==
X-Gm-Message-State: APjAAAW0iaLJ/nzOjPOmmfsAbWgY7Chy53/9VgFQVc4w4/CahBscym8I
        JgVdVA+5eke+mCDuXthXJZ8=
X-Google-Smtp-Source: APXvYqxdg2pDHqW9rTfLMG+4fzkr46MwVEfPvg8JRICiZR4cdoSB8MwnVlOrETNLveE8oLZVuzlXVQ==
X-Received: by 2002:a17:90a:b94c:: with SMTP id f12mr44774308pjw.64.1559768258811;
        Wed, 05 Jun 2019 13:57:38 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d5sm25878708pfn.25.2019.06.05.13.57.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 13:57:38 -0700 (PDT)
Date:   Wed, 5 Jun 2019 13:57:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus) Treat parameters as paged if on
 multiple pages
Message-ID: <20190605205737.GA632@roeck-us.net>
References: <1559764141-26105-1-git-send-email-hancock@sedsystems.ca>
 <1559764141-26105-2-git-send-email-hancock@sedsystems.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559764141-26105-2-git-send-email-hancock@sedsystems.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 05, 2019 at 01:49:00PM -0600, Robert Hancock wrote:
> Some chips have attributes which exist on more than one page but the
> attribute is not presently marked as paged. This causes the attributes
> to be generated with the same label, which makes it impossible for
> userspace to tell them apart.
> 
> Marking all such attributes as paged would result in the page suffix
> being added regardless of whether they were present on more than one
> page or not, which might break existing setups. Therefore, we add a
> second check which treats the attribute as paged, even if not marked as
> such, if it is present on multiple pages.
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ef7ee90..49dcb84 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1217,7 +1217,8 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  				      const struct pmbus_driver_info *info,
>  				      const char *name,
>  				      int index, int page,
> -				      const struct pmbus_sensor_attr *attr)
> +				      const struct pmbus_sensor_attr *attr,
> +				      bool paged)
>  {
>  	struct pmbus_sensor *base;
>  	bool upper = !!(attr->gbit & 0xff00);	/* need to check STATUS_WORD */
> @@ -1225,7 +1226,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  
>  	if (attr->label) {
>  		ret = pmbus_add_label(data, name, index, attr->label,
> -				      attr->paged ? page + 1 : 0);
> +				      paged ? page + 1 : 0);
>  		if (ret)
>  			return ret;
>  	}
> @@ -1258,6 +1259,29 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static bool pmbus_sensor_is_paged(const struct pmbus_driver_info *info,
> +				  const struct pmbus_sensor_attr *attr)
> +{
> +	int p;
> +
> +	if (attr->paged)
> +		return true;
> +
> +	/* Some attributes may be present on more than one page despite
> +	 * not being marked with the paged attribute. If that is the case,
> +	 * then treat the sensor as being paged and add the page suffix to the
> +	 * attribute name.
> +	 * We don't just add the paged attribute to all such attributes, in
> +	 * order to maintain the un-suffixed labels in the case where the
> +	 * attribute is only on page 0.
> +	 */
> +	for (p = 1; p < info->pages; p++) {
> +		if (info->func[p] & attr->func)
> +			return true;
> +	}
> +	return false;
> +}
> +
>  static int pmbus_add_sensor_attrs(struct i2c_client *client,
>  				  struct pmbus_data *data,
>  				  const char *name,
> @@ -1271,14 +1295,15 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
>  	index = 1;
>  	for (i = 0; i < nattrs; i++) {
>  		int page, pages;
> +		bool paged = pmbus_sensor_is_paged(info, attrs);
>  
> -		pages = attrs->paged ? info->pages : 1;
> +		pages = paged ? info->pages : 1;
>  		for (page = 0; page < pages; page++) {
>  			if (!(info->func[page] & attrs->func))
>  				continue;
>  			ret = pmbus_add_sensor_attrs_one(client, data, info,
>  							 name, index, page,
> -							 attrs);
> +							 attrs, paged);
>  			if (ret)
>  				return ret;
>  			index++;
