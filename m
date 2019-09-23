Return-Path: <SRS0=LAd6=XS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE258C3A5A6
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 07:18:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6AF0820820
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 07:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LevzafiJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731156AbfIWHSn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Sep 2019 03:18:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24868 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730090AbfIWHSn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Sep 2019 03:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569223121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aAEJDobrWIJJ9uqTw0X5GWpuHh0W2FM4r5UxCm9Imj0=;
        b=LevzafiJNBEyFJU6WHdrfgN/juuS4VZzoBkWiXZWLP+8dr6TFQ3LvTet96K32Z1LyxQNqC
        ZsrOcpRQp/+Ec8mOPtd2LEhD97W28J0Yx0BJYvA1DX+yxHRYaJlOQARvljynZS4rcgSBZe
        nCvzsy+5XtvPLZKvmBdO2EV43APtFO4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-HRD6Rvj6Puisi2RLeUzM9w-1; Mon, 23 Sep 2019 03:18:40 -0400
Received: by mail-pl1-f197.google.com with SMTP id k9so8129099pls.13
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Sep 2019 00:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qzuGESIcL8FWU8FXolqW/VJeEvjK0/h7k8MnZWk33Pw=;
        b=deRJee/9vlhSrDIxROPZY07xjYrgfYGgVkusetE85mGpxMUeWZ5OpFselLtOhdl82Y
         fHX6pWPpuv5r3BkMXirJXWpC+c0nAbzbXPMHAUJO8gf0JRpCbrQs7viytm0NzAhyv44H
         QRcYq9O6n5gN3fe4Muy368JSBCRNzttIkjgoxysZP49yKVb0ncIsiiZ45EqPEE0tRlGE
         A1Ig7nQ3HNxMUJL/+9uLPwFBgxKEkWCJ50zvpGA3PaUk0PrnWi7+8nLnAiIpHnCZAIL7
         P/UHLv3UPJZIZF3IOex3e1+s503bhOSh0VN9B81aIL713EXxlyzddsrC7aLDKrwBOBFb
         dKww==
X-Gm-Message-State: APjAAAWZzPKC+FFsJXizUaECwWV/2Y61NGb1LJdOzzLx0t9CsUAE1AuW
        H9txqnDrcKsIGEdyAVDNG6x8Va1wsDQHG9BrSElobK8oYxp1DhRqR5icGe7xNDRJ+1SskPJ30PT
        aqIvZtDMK+AyRnt0zJTYlmcap1EbjDnOMDtBX5fU=
X-Received: by 2002:a65:6798:: with SMTP id e24mr16429244pgr.39.1569223118818;
        Mon, 23 Sep 2019 00:18:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyO3zSKIjQwjrSEwcUsWbW/d+Ap8+NfiV6tJjzdvTai1hxvoCp2d5biGyvw9lV5kCYPYQhvzBhbncJxWzW/PYU=
X-Received: by 2002:a65:6798:: with SMTP id e24mr16429229pgr.39.1569223118635;
 Mon, 23 Sep 2019 00:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
In-Reply-To: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
From:   Lukas Zapletal <lzap@redhat.com>
Date:   Mon, 23 Sep 2019 09:18:22 +0200
Message-ID: <CAP80Qm2ouxPMsYjrp1b8cQ6DG7ZYej3ZJ4CwT5TW2mfDV5VhMg@mail.gmail.com>
Subject: Re: [PATCH] k10temp: update documentation
To:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-MC-Unique: HRD6Rvj6Puisi2RLeUzM9w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I just reposted the patch to hwmon and doc lists. My MUA have put some
trash characters in it, apologies for that.

--=20
Later,
  Lukas @lzap Zapletal

