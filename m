Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1943C2D0C0
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 02:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F51220715
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 02:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="roNv0wTP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfLXCqa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Dec 2019 21:46:30 -0500
Received: from mail-pj1-f41.google.com ([209.85.216.41]:52835 "EHLO
        mail-pj1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfLXCq3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Dec 2019 21:46:29 -0500
Received: by mail-pj1-f41.google.com with SMTP id a6so580240pjh.2
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Dec 2019 18:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=2VeN7as2GJPF/PMgQVJA8a+Qn7Yk9zNxsVPcf2tvpV0=;
        b=roNv0wTPLk8sCK5T38Hm/f0iCqv8E0Cr6g6x9Wb38CHNqh7IkO2RMUFRvnMtyc7sEz
         gdrtU4OzCYP74dvHiHNitfP5TfOejdSRGigge9OSvTdOAnkO0Lg2h6bqkj7g3ldRNdIH
         7BFIO0/mBlClJOONHgJ7LFNUi2Om1Y3yAHNim7z/jWRFsvqrmQms0KDsW4t5R0Aysap0
         i4NnSxgsq5tf+94AuVIlxwnGwfi+YyeTaDvQgOOnGbATKyePCsTBzJKK8kDkqVJoum7v
         qGbzWzTqjoZraKEas+77xxZ/N4kpGezSzUmGLiR7K3208YX24xxsVAtiMevAXkgoR/ss
         vB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=2VeN7as2GJPF/PMgQVJA8a+Qn7Yk9zNxsVPcf2tvpV0=;
        b=TDv6iyZIrQDkkSJg7T3ILa66hbUJg9vnyMa3Yt28lqn7sCOIEKUHv+s0ND2odCahQc
         nAHHvEcLKvcER1Enh/MKiXszNFn8JcTv5dR0IzP3Mr7Igf/AAAvlGMVXNM4CCqArwqlK
         c4fHANoIK1WBfC1ZA8M+MvAC0FK6Bbtxe9JkFI5erq17Eqi/BGbpY5z/Vx7TYUcRujm3
         yJyRDDC82ESdL4noAHPaCXI/Z3MjjMYVEeRCdROWoYvXB5AUt3NAXTj1I9B529Q26bJo
         01DjodFEQTsrgP+nWUNu0snFfG0cYeJYuOEGyT0GjXZcJKKjMpInBVols4KpktmkdDvJ
         O2Ww==
X-Gm-Message-State: APjAAAXXWkbmo6Ap1caIDsjgNMZRETaQXt1RY6buPe5IKLeXR3fwTK05
        XUNhL/d+i0QRVFafo4et+wI=
X-Google-Smtp-Source: APXvYqzis2p57TWVmhDWoT0Y9P73Kx0/stslcIF+U5wf8DoawStWapzZdaVxYKvFdGxcuCggVG2xxA==
X-Received: by 2002:a17:902:ab84:: with SMTP id f4mr34801208plr.35.1577155589256;
        Mon, 23 Dec 2019 18:46:29 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id g8sm25882906pfh.43.2019.12.23.18.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2019 18:46:28 -0800 (PST)
Reply-To: pgnet.dev@gmail.com
To:     linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
From:   PGNet Dev <pgnet.dev@gmail.com>
Subject: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others of
 Ryzen7 3700X"
Message-ID: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
Date:   Mon, 23 Dec 2019 18:46:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I'm running linux kernel 5.4.6-24.ge5f8301-default on an AMD Ryzen 3700X cpu.

I'm seeing very limited lm_sensors output.

I've posted my recent detail to an existing, but closed (?), lm_sensors issue,

	Can't display frequency and others of Ryzen7 3700X. #187
	https://github.com/lm-sensors/lm-sensors/issues/187#issuecomment-568630737

I note some recent work in kernel logs,

	https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.4

particularly by Marcel Bocu.

b4 (re)opening any new tickets, etc, checking-in here first.

*IS* the kernel support for Zen2 Ryzen 3700X incomplete, as yet?

And, *should* sensors output for Zen arch be full/complete?

Or is there something lm_sensors-specific going on here, preventing the sensors output?

Thanks for any comments/hints!

