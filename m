Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA38EE49A5
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Aug 2023 02:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjHWCRF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Aug 2023 22:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbjHWCRE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Aug 2023 22:17:04 -0400
X-Greylist: delayed 919 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:17:01 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE62E4A
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Aug 2023 19:17:01 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-08-64e5539cbe61
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 33.12.10987.C9355E46; Wed, 23 Aug 2023 05:32:28 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=g0NHgdk8vvIxzVZyRHkTUsgByZb4T22+fiZ5ei6vmk+6NTRTwd2NIAnOlcHpfFOMS
          UpDeE0TSldLNlkt+4821jwSxguHL11a+zzpjaeiualVU+6IngEANCJ7G1lGxeMib5
          9xdKBkO5VJ8Gt9eztd5PIxi6R7d8bpd91mv5FQBks=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=hd1JEVwd/rYQQ6cbhvTeAetC5rAWvoAfZphCzP3OTb6zVUtNNPCkyFqEz3I68/I70
          r9z88PRPx/+I2NRZieX0Uy03nqNoNEQlOP9EA/Njst3ALJNeYmXgQuBiob/pkKjwY
          qBXUSzQTQ7PINqpSzhDbNyO7KgePPud5hkadb5mI4=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:01 +0500
Message-ID: <33.12.10987.C9355E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-hwmon@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:15 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVyyUKGW3dO8NMUg//dNhbtr7cyOjB6fN4k
        F8AYxWWTkpqTWZZapG+XwJWxZN0FloLdzBVt/YtYGhgfM3UxcnJICJhIHPn/gK2LkYtDSGAP
        k0T39XssIA6LwGpmia9H9zNCOA+ZJb5d2sYEUdbMKNG4fhILSD+vgLXErKMzwGxmAT2JG1On
        sEHEBSVOznwCFdeWWLbwNXMXIweQrSbxtasEJCwsICbxadoydhBbREBeom9VDyOIzSagL7Hi
        azOYzSKgKnFs0l2wMUICUhIbr6xnm8DIPwvJtllIts1Csm0WwrYFjCyrGCWKK3MTgcGWbKKX
        nJ9bnFhSrJeXWqJXkL2JERiIp2s05XYwLr2UeIhRgINRiYf357onKUKsiWVAXYcYJTiYlUR4
        pb8/TBHiTUmsrEotyo8vKs1JLT7EKM3BoiTOayv0LFlIID2xJDU7NbUgtQgmy8TBKdXAuE5V
        MipB7etEV/f5L/fkvl+e8zspsUbmhYyaSE3j0p+ZPaHbGR5u6pzWLPk4Z+6ZKt1DMU17Fkbk
        7r/yMSpTPEk75mTVv6j7Iut/XXmQp6Xx6n343WNpogcWXNzk6XPgSr7c47BFTqvOfNonlNNY
        3f24bCq7w+fYa/sXBnFPrAtse/HA4zvvdCWW4oxEQy3mouJEAJu3ChRAAgAA
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

