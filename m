Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4C0C28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 18:27:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 484042075C
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 18:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sijoglvE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbfFES1F (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 14:27:05 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43233 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbfFES1E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 14:27:04 -0400
Received: by mail-pl1-f196.google.com with SMTP id cl9so4892104plb.10
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2019 11:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OQkxZgVi73y/FoCPffwqxDzYhJCnbfU7ovrxNFi+Hho=;
        b=sijoglvE+0FiNzotg35DNJZXHaZrxn8uYHf5M8GhExH7vNuk+vEKHiD57okfWJ7RKB
         zMqAgFJkentZPBFnpbR/k7vWxjZqmUznYCS+Ug8PbvMGytjF25otExbAkeMe9gh9X17Y
         8nUYkGzTrsWeM0zous8cVe349g04EmS3d7SdpysKVrRPiQ5Y9ffFFJZEFEeCqBXKeW0D
         ccAy2UQOQit77fD+fW4Zpg6aYqOzpvAI1eT9nnxyUtmnElMvbjdhzT6ol38g4ay5fd6x
         CA5mDtJGAwjEo+MyB55WTNb/t3kBcQJCredkHuUSCmfM2zZ5BDfVrxVcpbuYzcaQjYoV
         vJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=OQkxZgVi73y/FoCPffwqxDzYhJCnbfU7ovrxNFi+Hho=;
        b=T1tNGP+v0Xe5qKn4fwatFzrn6Bs2ZrjD3wTii7Y5S0kdJ8vNiBgweD65X61vfT3Z56
         9gnuqX5lY86XgSuQYTUfTwlzcb+yf7DRMg/DODJPMziTLgIWlTWIY4sls/Lyn+FlsRM0
         nONYxmo6pBXIMhKZUqD2Cx85NUojUUb4hKIzzJJ6Gp/uYXQIFrynjBjDbQpHaMLk9W3O
         zcTrciNFkdwOeg8/0L2nkBaE0iZ0Bk2qqKgN85P0fGI1sMAxQgwJmvlkAK7P3i9L9wgI
         Ly4FbjUEwT6U9rHOzQR7kM2hCIs/9Q+20H/7/QRP9Vv1eMGkCeQQPBOCZqCpySlv3kro
         Hx2Q==
X-Gm-Message-State: APjAAAX0TFxMo4Si7RMUpv4KWYqkqa6yuXiu3dwY+UnEjgzBXZDJaQBH
        GLV4XHtQ88gVSTenTMarVfA=
X-Google-Smtp-Source: APXvYqyEQxlTiAvgh6Kjyj97pNRT7l4b3RgaS+2bqJm2aniKwu1wpQwm+80e6bJqCEjXmEthiwFB/w==
X-Received: by 2002:a17:902:7b8d:: with SMTP id w13mr22606415pll.145.1559759223765;
        Wed, 05 Jun 2019 11:27:03 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e5sm28393344pgh.35.2019.06.05.11.27.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 11:27:02 -0700 (PDT)
Date:   Wed, 5 Jun 2019 11:27:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH 1/3] hwmon: (pmbus) Add paged support for VIN, IIN, PIN
 parameters
Message-ID: <20190605182700.GA15733@roeck-us.net>
References: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
 <1559751434-19879-2-git-send-email-hancock@sedsystems.ca>
 <20190605164852.GB32657@roeck-us.net>
 <dc45683b-6fee-6129-c024-a54c183799fb@sedsystems.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc45683b-6fee-6129-c024-a54c183799fb@sedsystems.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 05, 2019 at 11:14:46AM -0600, Robert Hancock wrote:
> On 2019-06-05 10:48 a.m., Guenter Roeck wrote:
> > On Wed, Jun 05, 2019 at 10:17:12AM -0600, Robert Hancock wrote:
> >> Previously the VIN, IIN and PIN parameters were marked as non-paged,
> >> however on the IRPS5401 these parameters are present on multiple pages.
> >> Add the paged flag for these parameters so they can be detected properly
> >> on such chips.
> >>
> > 
> > Have you tested the impact of this change on other chips where the
> > registers are non-paged ?
> 
> No, I don't think I have any devices available that have another pmbus chip.
> 
> > To reduce risk due to potentially mis-detecting support on other chips,
> > it may be better to add a separate backend driver for this chip. This
> > would also enable support for the MFR_VOUT_PEAK, MFR_IOUT_PEAK, and
> > MFR_TEMPERATURE_PEAK registers which is otherwise unavailable.
> 
> To clarify, you're saying instead of having the auto-detection for those
> in the generic pmbus driver, create a separate irps5401 driver that
> would explicitly add in those parameters?
> 
Yes.

> This particular patch to pmbus_core.c would still be required in order
> for the paged parameters to be displayed properly - it shouldn't break
> anything on chips that don't detect these parameters on multiple pages.
> 

It should still work, though, except that there would be duplicate labels.

On the downside, with this change, the "vin" etc. label would be "vin1"
for all chips, not just this one. That may break compatibility if there
are users out there looking for specific labels. We may need a better
and more flexible solution to address this problem. For example, the core
could not only look for ".paged", but check if the respective attributes are
present in more than one page, and if so override the "paged" flag.
Something like the following (untested).

static bool pmbus_sensor_is_paged(const struct pmbus_driver_info *info,
				  const struct pmbus_sensor_attr *attr)
{
	int p;

	if (attr->paged)
		return true;

	for (p = 1; p < info->pages; p++) {
		if (info->func[p] & attr->func)
			return true;
	}
	return false;
}

...

static int pmbus_add_sensor_attrs(...)
{
	...

	bool paged = pmbus_sensor_is_paged(info, attrs);

	pages = paged ? info->pages : 1;
	...
	ret = pmbus_add_sensor_attrs_one(client, data, info, name, index, page, attrs, paged)
										       ^^^
										       new parameter
}

Guenter

> > 
> > Thanks,
> > Guenter
> > 
> >> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> >> ---
> >>  drivers/hwmon/pmbus/pmbus_core.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> >> index ef7ee90..6e3aaf1 100644
> >> --- a/drivers/hwmon/pmbus/pmbus_core.c
> >> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> >> @@ -1395,6 +1395,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
> >>  		.reg = PMBUS_READ_VIN,
> >>  		.class = PSC_VOLTAGE_IN,
> >>  		.label = "vin",
> >> +		.paged = true,
> >>  		.func = PMBUS_HAVE_VIN,
> >>  		.sfunc = PMBUS_HAVE_STATUS_INPUT,
> >>  		.sbase = PB_STATUS_INPUT_BASE,
> >> @@ -1499,6 +1500,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
> >>  		.reg = PMBUS_READ_IIN,
> >>  		.class = PSC_CURRENT_IN,
> >>  		.label = "iin",
> >> +		.paged = true,
> >>  		.func = PMBUS_HAVE_IIN,
> >>  		.sfunc = PMBUS_HAVE_STATUS_INPUT,
> >>  		.sbase = PB_STATUS_INPUT_BASE,
> >> @@ -1584,6 +1586,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
> >>  		.reg = PMBUS_READ_PIN,
> >>  		.class = PSC_POWER,
> >>  		.label = "pin",
> >> +		.paged = true,
> >>  		.func = PMBUS_HAVE_PIN,
> >>  		.sfunc = PMBUS_HAVE_STATUS_INPUT,
> >>  		.sbase = PB_STATUS_INPUT_BASE,
> >> -- 
> >> 1.8.3.1
> >>
> 
> -- 
> Robert Hancock
> Senior Software Developer
> SED Systems, a division of Calian Ltd.
> Email: hancock@sedsystems.ca
