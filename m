Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014E7C77B7C
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 May 2023 14:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjEGOkS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 May 2023 10:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbjEGOkR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 May 2023 10:40:17 -0400
Received: from m228-4.mailgun.net (m228-4.mailgun.net [159.135.228.4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7919E13C3D
        for <linux-hwmon@vger.kernel.org>; Sun,  7 May 2023 07:40:16 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1683470415; x=1683477615; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=RreZAVcyefedcZBaVH9BWSwdNdF4YJTlkaVu3S0N8c0=;
 b=GWhIzn/QadVE+9rBLxPT3BTwUvG8bdcn5TEAk6syEQFuW0n2OVLiavMRqKZPs6dDa6f2Hs6Ec2nymLA5JQ1XF+A8NGbIBcTNAzWFYAR3HD4+t01ymbfeABIkmdYEAfMkDO/N6/qNPegy+/PTrgoGQ/QgmF8fAQMOzFEtSw+JHNKA4W3MmgSAGCfigbhn6S4JpASuE5ZLFbuV+cFtg1CIaPDAXIHKNt7NyrtOkjGYXqhISBRU5BD5eIH6W3xZwpjeoh/FmV7LjIGFXtN+ZmdY/8cGpSp327hGdPRZfDzW7WpJv1uwlmXHEGafxGChHjAV1wMELuefEHjrjTSuZadqPg==
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 4ea46d00a2ee with SMTP id
 6457b84f2ce85fdbb9469638 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 07 May 2023 14:40:15 GMT
Sender: james@equiv.tech
Date:   Sun, 7 May 2023 07:40:13 -0700
From:   James Seo <james@equiv.tech>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC 04/11] Documentation/hwmon: Revise hwmon kernel API
 reference
Message-ID: <ZFe4TfGAcuIfXUiO@equiv.tech>
References: <20230504075752.1320967-1-james@equiv.tech>
 <20230504075752.1320967-5-james@equiv.tech>
 <512351f8-e571-620a-1b2b-54989c079803@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <512351f8-e571-620a-1b2b-54989c079803@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, May 06, 2023 at 06:52:09AM -0700, Guenter Roeck wrote:
> There is a lot of nnecessary churn in your patches, where you reformat entire
> paragrahps just to add a few "``". This makes it almost impossible to identify
> the actual changes. For me it means that the review burden is so much that I'll
> probably never get to actually review those changes.
> 
> Please split the changes into subjects, following the "one logical change per
> patch" rule, and please refrain from changing entire paragraphs when adding
> markups. Also, a reference to the markup rules explaining if and when markups
> are warranted would be nice. For example, I have no idea why "hwmon" would
> warrant a markup.
> 
> Guenter
>

Ack. Thanks for this. It's the sort of feedback I was hoping to receive
by submitting as an RFC series.

James
