Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12256C001DC
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 Jul 2023 19:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjGVTMi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 22 Jul 2023 15:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjGVTMg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Jul 2023 15:12:36 -0400
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BD48E65
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Jul 2023 12:12:33 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1690053153; x=1690060353; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=WQzZK+blyTCu7eLt0L8ry7tHXhEBXBc4LGk52ofwZsI=;
 b=hFTfXobAG0mUpxWHlyhc+qhJ7VqI1MtQRqYD84Gf9KFxhclEuXPx8G3ov35QGvtH96FWR4gQbYVMzrIplpWalgoNw1F/+Rz1272vhd45/lTbFslGklbHtAJTkjt+pSJeUgx+B+GZxX4Eki6UCSrvm7Acg9k9t3eyqvYbgbJ8xvqnDrnwuTgZRPpOyF0Bjm/ImRXz1ryrUE/j007Ip9uUtAHYmReyoPlw81DAIM+U/WG0lOAYgyglVWSXcpqsQJq9vJbGFiPJGn60r85q6OL+xllRtt8sTkMFwYvIOE4g29Fba9oJD56ZIma+ZqgGAZBo4Jvwdo72SsRWLK9ix1pGRg==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 23c5fbb932a2 with SMTP id
 64bc2a21cd5627293bffe733 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Jul 2023 19:12:33 GMT
Sender: james@equiv.tech
Date:   Sat, 22 Jul 2023 12:12:32 -0700
From:   James Seo <james@equiv.tech>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: hwmon: hp-wmi-sensors: Change document title
Message-ID: <ZLwqIIq0yj3gejEX@equiv.tech>
References: <20230722172513.9324-1-james@equiv.tech>
 <20230722172513.9324-3-james@equiv.tech>
 <7a689374-25bd-4b82-acbe-159fb85a2347@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a689374-25bd-4b82-acbe-159fb85a2347@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jul 22, 2023 at 11:24:18AM -0700, Guenter Roeck wrote:
> On Sat, Jul 22, 2023 at 10:25:14AM -0700, James Seo wrote:
>> Change title to "Kernel driver hp-wmi-sensors" for consistency with
>> most of the rest of Documentation/hwmon.
> 
> Not sure if it is worth it, but either case: Signed-off-by: missing.
> 
> Guenter

Oops. Forget it for now, then. I'll resubmit if/when there are more changes.

Thanks.

James

