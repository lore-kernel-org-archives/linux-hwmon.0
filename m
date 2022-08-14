Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABAA1C25B06
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Aug 2022 19:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiHNTIb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 14 Aug 2022 15:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiHNTIa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 Aug 2022 15:08:30 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D91205C3
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Aug 2022 12:08:28 -0700 (PDT)
Date:   Sun, 14 Aug 2022 19:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=b5wv7pgfinaz3hbaz6wrbzpuri.protonmail; t=1660504104; x=1660763304;
        bh=XFy7zyPtIuDdjoy7tzjw5wfpzmcmvGYNTQPecbYgltg=;
        h=Date:To:From:Reply-To:Subject:Message-ID:Feedback-ID:From:To:Cc:
         Date:Subject:Reply-To:Feedback-ID:Message-ID;
        b=mPXXrSUM/+eq2ns6I7ycdZ0DjCQ50nzj7oy+eOmQWcYFahozivbmskTYJGZcu0Xjc
         +x6UWFWKoIEIW4VJZq2aqyMbX9XKwiU64RU833TpV8h6WySQge+197n3qTJ9u8RMBN
         GgK8nwVaox4t/W1rSJgJZqTvgGEKZoWszOK8ihpsh9q4DasqWxiuaJ+8hnbYUqHKcW
         l1HN2Ig3rvGJtHtEE84vly3k256IAZWh3XrYdVLOFtKzboqNlNla8s7n1SCTSJa4wc
         tfabRxIqqIRRyFRcWie/CmGEZSy42g406AnPjXRrHtV5UEbwYxGye8qV31+JUjSpq1
         Cf/l/FmVyTcmQ==
To:     linux-hwmon@vger.kernel.org
From:   Joseph Strauss <jstrauss16@proton.me>
Reply-To: Joseph Strauss <jstrauss16@proton.me>
Subject: AS621x driver
Message-ID: <20220814190815.sgybykap5vmdmlwr@libretux>
Feedback-ID: 52406082:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The AS621x is a digital temperature sensor chip with an I2C interface. It h=
as applications in electronic equipment, personal computers, wearables, and=
 HVAC. The datasheet can be found here: https://ams.com/documents/20143/360=
05/AS621x_DS000677_4-00.pdf

I wish to write a driver for this device and contribute it to the kernel, a=
s my first module. It being my first module, I wanted to make sure that thi=
s was a worthy use of everyone's time and that it could be useful at some p=
oint. Sparkfun provides a convenient breakout board already, which is the o=
ne that I will be using.

After searching through the mailing list archive, I found a set of patches =
from 2016 for the AS6200 as part of the iio subsystem. For reasons I could =
not find, the driver never got merged. I guess the original developers move=
d on to something else. Additionally, they were discussing towards the end =
how the hwmon subsystem may have been a better fit for the driver. Therefor=
e, I wanted to hear everyone's thoughts on writing this driver before I get=
 started on it. From what I can tell, it does not seem much more complex th=
an some other temperature sensor drivers in the kernel, such as the tmp102.

Regards,
Joe Strauss

