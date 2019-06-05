Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AA0C28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 19:30:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B450206C3
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 19:30:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNgh3Zbl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfFETah (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 15:30:37 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35652 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfFETag (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 15:30:36 -0400
Received: by mail-pl1-f193.google.com with SMTP id p1so10059364plo.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2019 12:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ss+TvaT4GfbaY7o5FAJi9G4pvPIlWofDwbFm23j0vyk=;
        b=eNgh3ZblJ2zoB+7XCUKxYWnz/w2xWePdJQBZBvzDww1A6OxNMLaWoFw9mPTyeZRLEj
         w4IEFPp9svmYgop8x7p5Oq9XE+6WtQtjh+SuiITVFMS4UwjGT9aabvjO5ifbRmaxHxp6
         Vuy1WH4tL6v0r1613gnUMRZVpCiKDTtHolNrOkhhIiUnW24PRoBKTSKA9tgzhRy2tSJL
         dfW3iXxd9WiIIEsq8L7mJ7SoGZeZAxEMpMbMl0LHFqo0VxL/H+0uLOPNYma5iiGSy6/5
         XvNjdx9b/299DBBfL769fDEMjrSXLh6PXEaAf3oKR6+gSuREealV7Mgjbjz9Q/xEvyKk
         W74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ss+TvaT4GfbaY7o5FAJi9G4pvPIlWofDwbFm23j0vyk=;
        b=RgT3hDFTijoNLx3NBaIxaigj62azricjJHTZ/7ZzgQyrC9qwjKQWYxEt1ehRzHESwG
         xKXKqlGehkEeSNf92Rx/bTb9ITM7E5q7PhtbGX3a6VIDm8XSEby0N5PAVRkAGNPqrP9g
         txT8RHNgpANhDaRhRBWHJkPR+CAmfcBh8vzDBAfb9srUIpHTXmJmhH9zEL92Z5NRIbUL
         mgIljz1H8ZOB2h8KaDZgFMvo0MxBylI6rtVN75b3d/y72brl30dWW2hFZNLV5YiRvneS
         gllYiCnAmJK2yCIHtqA+2dg9PVpsXnQ6ig/D63Jk9SUq1aEjay1fRolDRPsnAQ6X1tkF
         oZ3Q==
X-Gm-Message-State: APjAAAXlnB7LAra9dPrDHsrCsA6R4dHcDUr5uoPyt5bI1gBuSxXtoIgu
        tSNpBMMAWvQ6YsS7AS5Em+l2s3aw
X-Google-Smtp-Source: APXvYqw1gZa+CEFNm6LKkPWOuiNk3Co3tccC9e+7mt4OUzMdBwVNLRNFL0NpaKXffybpO0gye0V88Q==
X-Received: by 2002:a17:902:624:: with SMTP id 33mr46603469plg.325.1559763036174;
        Wed, 05 Jun 2019 12:30:36 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f10sm18772501pgq.73.2019.06.05.12.30.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 12:30:34 -0700 (PDT)
Date:   Wed, 5 Jun 2019 12:30:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Hancock <hancock@sedsystems.ca>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH 1/3] hwmon: (pmbus) Add paged support for VIN, IIN, PIN
 parameters
Message-ID: <20190605193033.GA15554@roeck-us.net>
References: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
 <1559751434-19879-2-git-send-email-hancock@sedsystems.ca>
 <20190605164852.GB32657@roeck-us.net>
 <dc45683b-6fee-6129-c024-a54c183799fb@sedsystems.ca>
 <20190605182700.GA15733@roeck-us.net>
 <612d2dad-59db-0a11-a393-1f3edad772bb@sedsystems.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <612d2dad-59db-0a11-a393-1f3edad772bb@sedsystems.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 05, 2019 at 01:22:21PM -0600, Robert Hancock wrote:
> On 2019-06-05 12:27 p.m., Guenter Roeck wrote:
> >>> To reduce risk due to potentially mis-detecting support on other chips,
> >>> it may be better to add a separate backend driver for this chip. This
> >>> would also enable support for the MFR_VOUT_PEAK, MFR_IOUT_PEAK, and
> >>> MFR_TEMPERATURE_PEAK registers which is otherwise unavailable.
> >>
> >> To clarify, you're saying instead of having the auto-detection for those
> >> in the generic pmbus driver, create a separate irps5401 driver that
> >> would explicitly add in those parameters?
> >>
> > Yes.
> 
> OK, I can do that. We initially had a separate driver file for this, but
> ended up changing it to update the generic detection instead. But the
> separate driver file is likely safer.
> 
> > 
> >> This particular patch to pmbus_core.c would still be required in order
> >> for the paged parameters to be displayed properly - it shouldn't break
> >> anything on chips that don't detect these parameters on multiple pages.
> >>
> > 
> > It should still work, though, except that there would be duplicate labels.
> 
> I don't think it actually does work, at least not in the sensors utility
> - I haven't diagnosed where it was going wrong, but either not all of
> the attributes are successfully added at the kernel level, or libsensors
> filters out the "duplicate" entries and you only see one of them in the
> output.
> 
Possibly it is a problem with libsensors. I don't have any of those chips
(or evaluation boards), so I never noticed.

> Actually, it appears there are already drivers in tree that have
> multiple pages with VIN, PIN and/or IIN values, such as ir35521, which
> would already have this problem.
> 
Yes.

> > 
> > On the downside, with this change, the "vin" etc. label would be "vin1"
> > for all chips, not just this one. That may break compatibility if there
> > are users out there looking for specific labels. We may need a better
> > and more flexible solution to address this problem. For example, the core
> > could not only look for ".paged", but check if the respective attributes are
> > present in more than one page, and if so override the "paged" flag.
> > Something like the following (untested).
> 
> I think that may be the best solution - though as I mentioned, there are
> already some drivers whose behavior would be changed by this in that
> they would end up with vin1 and vin2 instead of vin, etc. In those
> cases, however, there might be no real alternative - it's not even clear
> that the current behavior the user would get in that case would even be
> consistent in terms of which parameter would actually be shown,
> depending on how that is handled in libsensors.
> 
For those drivers I would consider this to be a bug fix.

An alternative would be to go with "vin", "vin2", and so on, but I don't
really like that.

Guenter
