Return-Path: <SRS0=hA7Y=ST=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABCAC282DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 19:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECFBD20835
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 19:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsS8F7TZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730230AbfDQTgQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 17 Apr 2019 15:36:16 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47033 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729779AbfDQTgQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Apr 2019 15:36:16 -0400
Received: by mail-pf1-f196.google.com with SMTP id 9so12538778pfj.13
        for <linux-hwmon@vger.kernel.org>; Wed, 17 Apr 2019 12:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9Xv2AiLBxP230NxpULtJp+e6BKtInrvQjlgICyg83+g=;
        b=RsS8F7TZMNCGNmZqltNN/pQwVSWUYZjDL3Ej0UML50GFbAt0eeKN8ETLg3NZuTOTAx
         FguVRwJdeL0e5ff7+PsKMkWjYmxLwbbe3wAuBF1+pN4ckGNltMwaVWTgc34DUmYBzDu/
         xFWKJe20R1VbLtdI8XDgGuEVQnI5pmvqui7+ZgVd28XBShfNJT/wpy2k02tO4tKBor3O
         nb86/8PWTeckiQvZAswh2MXWNeyf+9dihkoDutm1n/pON5k89haHcwR2PWmZOxxixJl4
         DGAvnnxx4FHxSO2JfumF0mhc1YZ+GDqrCA0Jn3IwBseXTDrHYKrTUXr20jb/cw8a3LfI
         CARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Xv2AiLBxP230NxpULtJp+e6BKtInrvQjlgICyg83+g=;
        b=mnpu7VayMVKbS2+rUUJ1RQeFNkY9kAfwpObBipsu/8b/WLxcGPYScxXMzGOZHxx+Eh
         6v07IMfVDaetQamWDXV0nans74hsImOQfDT456IuH/WuNNErJvrkbuNfcQEQkxAB+Pnx
         d3K2sC6XIWG4Ci4lwHN1V6piGd4brj250rcD2yYLWb6FYiRZqAG1Z5WKop7OZ6qku9qL
         jwqnK5eXcYk3fl5UlgHoLaYMT+hGFpMXPZxmcWxKOxowwfgaIJN9PwAx265o++UgRW3z
         4QT1DK6tP4LJXN2ZqHz5RENKhZFQyLlPvn9k2m4GVRmSkhDG119qj5mLxzjIfPHxFeAX
         5fcQ==
X-Gm-Message-State: APjAAAWfHB7vEPnXgMXA3lWMyStDJvTZrd+7xTbD4v+b/6KdsXcWdIRz
        jhb2YxDjFC8y9+/HtFpaUUs=
X-Google-Smtp-Source: APXvYqxmUfDr1+XvAo4GxGZO3KmrGyKEyt1gPl74YFKvFj4iRjawWXEAz+iThNskLWxBI+V9A6UeXw==
X-Received: by 2002:a65:5c8c:: with SMTP id a12mr84639573pgt.296.1555529775726;
        Wed, 17 Apr 2019 12:36:15 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1sm29118622pgq.15.2019.04.17.12.36.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 12:36:15 -0700 (PDT)
Date:   Wed, 17 Apr 2019 12:36:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Alexander Amelkin <a.amelkin@yadro.com>,
        linux-hwmon@vger.kernel.org,
        "Edward A . James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org,
        Alexander Soldatov <a.soldatov@yadro.com>
Subject: Re: [PATCH v2 1/1] hwmon (occ): Add temp sensor value check
Message-ID: <20190417193614.GB23825@roeck-us.net>
References: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
 <1555524209-26997-1-git-send-email-a.amelkin@yadro.com>
 <48e874f0-c865-12c7-cf93-5e569c27f877@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48e874f0-c865-12c7-cf93-5e569c27f877@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 17, 2019 at 01:35:41PM -0500, Eddie James wrote:
> 
> On 4/17/19 1:03 PM, Alexander Amelkin wrote:
> >From: Alexander Soldatov <a.soldatov@yadro.com>
> >
> >The occ driver supports two formats for the temp sensor value.
> >
> >The OCC firmware for P8 supports only the first format, for which
> >no range checking or error processing is performed in the driver.
> >Inspecting the OCC sources for P8 reveals that OCC may send
> >a special value 0xFFFF to indicate that a sensor read timeout
> >has occurred, see
> >
> >https://github.com/open-power/occ/blob/master_p8/src/occ/cmdh/cmdh_fsp_cmds.c#L395
> >
> >That situation wasn't handled in the driver. This patch adds invalid
> >temp value check for the sensor data format 1 and handles it the same
> >way as it is done for the format 2, where EREMOTEIO is reported for
> >this case.
> 
> 
> Thanks Alexander and Guenter.
> 
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
> 

Applied.

Thanks,
Guenter

> 
> >
> >Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> >Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
> >Reviewed-by: Alexander Amelkin <a.amelkin@yadro.com>
> >Cc: Edward A. James <eajames@us.ibm.com>
> >Cc: Joel Stanley <joel@jms.id.au>
> >---
> >  drivers/hwmon/occ/common.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> >diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> >index 4679acb..825631c 100644
> >--- a/drivers/hwmon/occ/common.c
> >+++ b/drivers/hwmon/occ/common.c
> >@@ -235,6 +235,12 @@ static ssize_t occ_show_temp_1(struct device *dev,
> >  		val = get_unaligned_be16(&temp->sensor_id);
> >  		break;
> >  	case 1:
> >+		/*
> >+		 * If a sensor reading has expired and couldn't be refreshed,
> >+		 * OCC returns 0xFFFF for that sensor.
> >+		 */
> >+		if (temp->value == 0xFFFF)
> >+			return -EREMOTEIO;
> >  		val = get_unaligned_be16(&temp->value) * 1000;
> >  		break;
> >  	default:
> 
