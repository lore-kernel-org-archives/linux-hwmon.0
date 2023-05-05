Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BDAC77B7F
	for <linux-hwmon@archiver.kernel.org>; Fri,  5 May 2023 15:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbjEEPBR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 5 May 2023 11:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231941AbjEEPBQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 5 May 2023 11:01:16 -0400
Received: from m228-13.mailgun.net (m228-13.mailgun.net [159.135.228.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E751016369
        for <linux-hwmon@vger.kernel.org>; Fri,  5 May 2023 08:01:14 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1683298874; x=1683306074; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=j5Y8/YxWyoZ+TMXH031Qq4b+VwVzb7sYuIJBdbFKn+o=;
 b=gYULfPiSnaSbmWO016+m17diIzAsGJzr5ZjdflDbdDm9Ruo0Ks/KeYBcc4deN4V4pdse7UbDxiMcR66xXJy1N1LeZbXOBt6EXwS5uW+cPlON6a0/UNsA/XIxWY/D67UlfjlZbO9yL5YDThTyah5a2aRL4dFJHGj6UKiCAwsbeZcHgXrMK/Y9pQjL0Cs8dGYxDc9fOyfMxFK5KfKjdO/Xn9JNzJGbhIauzGQpdHLpZrgA/9pRE2hxmX2SAtlhrOzKizZOtWpu18+suM9Ooxt6h1nBx1HpbKmtYXCHkiUZxEo2oS8ZYy5RCTS9s6Us66EmGQhoWpCaWQlsQHBxYCYSRw==
X-Mailgun-Sending-Ip: 159.135.228.13
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by e393140286f2 with SMTP id
 64551a365e23e5f95b516f97 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 May 2023 15:01:10 GMT
Sender: james@equiv.tech
Date:   Fri, 5 May 2023 08:01:09 -0700
From:   James Seo <james@equiv.tech>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 07/11] Documentation/hwmon: Revise sysfs interface
 specification
Message-ID: <ZFUaNQAxjvnFnsOr@equiv.tech>
References: <20230504075752.1320967-1-james@equiv.tech>
 <20230504075752.1320967-8-james@equiv.tech>
 <ZFSLN6KmGgfW4YzE@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZFSLN6KmGgfW4YzE@debian.me>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 05, 2023 at 11:51:03AM +0700, Bagas Sanjaya wrote:
> On Thu, May 04, 2023 at 12:57:48AM -0700, James Seo wrote:
>> +**RO**    Read-only value.
>> +**WO**    Write-only value.
>> +**RW**    Read/write value.
> 
> Why are the permissions be emphasized?

I don't remember, to be honest. I will deemphasize permissions.

> 
>> +| | ``pwm[1-*]_auto_point[1-*]_pwm``        | **RW** | PWM temperature curve definition    |
>> +| | ``pwm[1-*]_auto_point[1-*]_temp``       |        | for chips that associate trip       |
>> +| | ``pwm[1-*]_auto_point[1-*]_temp_hyst``  |        | points with PWM output channels.    |
>> ++-------------------------------------------+--------+-------------------------------------+
>> +| | ``temp[1-*]_auto_point[1-*]_pwm``       | **RW** | PWM temperature curve definition    |
>> +| | ``temp[1-*]_auto_point[1-*]_temp``      |        | for chips that associate trip       |
>> +| | ``temp[1-*]_auto_point[1-*]_temp_hyst`` |        | points with temperature channels.   |
> 
> Dunno if replacing line blocks with bullet lists should improve the semantic
> of three sysfs files having the same description.
> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara

These are line blocks, not bullet lists. They ensure that each
attribute name is on its own line, avoiding strange wrapping like:

  pwm[1-*]_auto_point[1-*]_pwm pwm[1-*]_auto
  _point[1-*]_temp pwm[1-*]_auto_point[1-*]_temp_hyst

