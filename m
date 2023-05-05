Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B89C7EE22
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 May 2023 13:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbjEEN3W (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 May 2023 09:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbjEEN3U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 May 2023 09:29:20 -0400
Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B2D1F4AA
        for <linux-hwmon@vger.kernel.org>; Fri,  5 May 2023 06:29:19 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1683293358; x=1683300558; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=aO9K7NPvdxrmC7vIMAsNBMR6TnQRDey4237WbWDA7Gs=;
 b=mUz36zLYO4r7gqamR1EJ+UJuScQfvp84RsuZQ5VaVR32hz1G2ZuZSi91A1P6ObDsTGmplLZ5Pr0chJGDMJm1RLY3txN1MeDxzM4hCTYLlU3DOyw2GRAsUZ5D65p9Ty5Y4ETtAN9ojnsUNgt1co7kFVAiSRxGXZLNBZ0V1uD6lDr2gwmQOggCmBWYAI6v/oM+DYjSWGE0KO5YGJ/M+9sTjiZuN8GSyXtWtgxRincKKgnXjY4L+A/kQVSrNlta0YgerARO+hXfd6RJN9r33WLSFkFJlYrT4OPEPtMYFy+6WqCONTH0uVkRuCNKJ9lzCB0ydUzoX641YK/VTgBk/AQ72Q==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 242c85f0262a with SMTP id
 645504ae3cb0b25455ddf088 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 May 2023 13:29:18 GMT
Sender: james@equiv.tech
Date:   Fri, 5 May 2023 06:29:17 -0700
From:   James Seo <james@equiv.tech>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 04/11] Documentation/hwmon: Revise hwmon kernel API
 reference
Message-ID: <ZFUErfFIalIFEtlu@equiv.tech>
References: <20230504075752.1320967-1-james@equiv.tech>
 <20230504075752.1320967-5-james@equiv.tech>
 <ZFSEIahcPf2QUYDv@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZFSEIahcPf2QUYDv@debian.me>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 05, 2023 at 11:20:49AM +0700, Bagas Sanjaya wrote:
> 
> I forget to mention this.
> 
> Elsewhere in the doc tree (Documentation/), metadata is usually marked
> up like:
> 
> ---- >8 ----
> diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
> index cf084e04052228..541835f7826352 100644
> --- a/Documentation/hwmon/hwmon-kernel-api.rst
> +++ b/Documentation/hwmon/hwmon-kernel-api.rst
> @@ -2,7 +2,7 @@
>  The Linux Hardware Monitoring kernel API
>  ========================================
>  
> -Guenter Roeck
> +:Author: Guenter Roeck
>  
>  .. contents::
>  
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara
Hi,

Thanks for reviewing.

I will add the :Author: tag to this document.

James

