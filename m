Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9957DC2D0C3
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 20:35:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5671C20731
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 20:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyENrzlx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfLXUfB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 15:35:01 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54000 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfLXUfB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 15:35:01 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so1568112pjc.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Dec 2019 12:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:reply-to:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NChN0tJJSyW1oIcBf4nfG9lF19f4PhqCbXtyX2LGgNw=;
        b=pyENrzlxim6chHt6B7cz8vA16SphyhDgkvJ0qYxcl4BaClhd90+/vICWIczXtTTL0t
         t/nK7WLq4ezX17qciXTmPk0HnYJ2CTW+V7HJxIWQKqr7ArU53+qVeLMeNITRzYGMaI9a
         BluclgLfKAZKtf8o7d4YnGaxqCrXhb/tnSJSFTAJSrmcmnO/Yy/+k5yd+J4tg8lFnHay
         xf027lTIHP1jaXAzcq5OhgSHxE0ujFNk9iMfqnBS0X8rdeY3EaOjBJSSZkD8Riv62Ama
         ipVnA9xDZPj4TfF4gv68zhDzzPolRgQhxzx+qAOpsGj8leuL9L0AEYZG5NVX8LPGzitQ
         MgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:reply-to:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NChN0tJJSyW1oIcBf4nfG9lF19f4PhqCbXtyX2LGgNw=;
        b=c21tNo7NFzyLhs7nDjVVfakHggEakXwP64Z5wjo1gLHkQe/SrzoG9c0u/jpS1GnS4l
         GeYgVVD4pdOkMPo/Z7vd5wydnpyoO/5bAaEIIi7qmL1utjjigq3Syj+B/K5Zad7lF1fD
         L7lNFnvniDxJaKKT4Sdp+Qc8bDGzmBKBL9I9vzWOno2cOxWQZ64MsdWNAHdq8cb7esVu
         ualE5MHxZOjuhNEVp+9d+T6QH6wyR3YUX+C4c+u8qX61ONBUfw+/LEEvlwacWQ5aUFU/
         RbzCZyqN+uyvWlkQbEYyoLMPq5vBdsfCC7XBZ7jRjtOj0I5Xdh8I0sFncEZAbR1Rn6U6
         i8Uw==
X-Gm-Message-State: APjAAAVQe8EznTpwTtnNBhLrMSAsce9MnFaRMYEXkCSg2fyrIIbGjTpt
        /gV7kV43JlUzm1yrLM6GdA/GkoBv
X-Google-Smtp-Source: APXvYqzv2qoIkGEGcSLeAgOJ5Op0xym4O8ulCZn4GxPVwDg0bO3oMqAXK1ykCMVhi0IEh/1gDOewCw==
X-Received: by 2002:a17:902:740c:: with SMTP id g12mr39031437pll.166.1577219700711;
        Tue, 24 Dec 2019 12:35:00 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id 13sm29280904pfi.78.2019.12.24.12.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 12:35:00 -0800 (PST)
From:   PGNet Dev <pgnet.dev@gmail.com>
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
Reply-To: pgnet.dev@gmail.com
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
 <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
 <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
 <121bee85-6369-4b32-2504-c1d104ea2bd6@roeck-us.net>
 <4a1e2dc9-3303-8dd5-7bbd-3605a43bffe1@gmail.com>
 <34008d92-9709-786e-5c76-007edffe0a7c@roeck-us.net>
 <bf771959-f19b-1abb-7d94-bb5f65c68952@gmail.com>
 <5400ddb2-c70d-11b4-4414-158c7c40afa5@roeck-us.net>
Message-ID: <218bc0cd-3b42-55a8-9726-1baf2f0a2aee@gmail.com>
Date:   Tue, 24 Dec 2019 12:34:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5400ddb2-c70d-11b4-4414-158c7c40afa5@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/24/19 11:57 AM, Guenter Roeck wrote:
> The BIOS does exactly what the board vendor wants it to do: Reject direct access
> to the Super-IO chip. The board vendor wants you to access the chip through ACPI,
> ie with asus_atk0110. Unfortunately, it looks like the board vendor also
> changed the ACPI data sufficiently enough to make that driver not work for
> your board (assuming you tried loading it without acpi_enforce_resources=lax).


WITH module

	lsmod | grep asus_atk
		asus_atk0110           24576  0

but WITHOUT cmd line

	... acpi_enforce_resources=lax ...


`sensors` returns ONLY the limited

	sensors
		k10temp-pci-00c3
		Adapter: PCI adapter
		Tdie:         +34.4°C  (high = +70.0°C)
		Tctl:         +34.4°C

OTOH, switching, WITHOUT module

	lsmod | grep asus_atk
		(empty)

and WITH cmd line

	... acpi_enforce_resources=lax ...


`sensors` returns the full(er) output, as posted.

note again, in this case, even ATTEMPTING to load asus_atk0110 FAILs due to the apparent conflict with the =lax spec'n.

> There is nothing we can do about that unless the board vendor provides the information
> necessary to interpret the DSDT, or someone spends the time to reverse engineer it.

got it.  i'll poke at ASUS support.

thx 4 the education re: this^^ !
