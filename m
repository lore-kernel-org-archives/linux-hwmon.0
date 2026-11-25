Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795616608;
	b=MgA8lHONwzxAkplcF+iO+swuDFaTaJRGdP+CINL/Zhf1F07e6pvykB2Ltc8OXSTKg2yj
	 vRbjmiJZrnlyl3GGMSG2px9KUklH1TI7Rvo4DCRx5WrPoS/X3vKO7ql+suLGmCrEkHMfl
	 6P1mX4giHuPSqFyDY+ETT+VYNp8DfapiDjazxK3GKkpUl7sAK0Xmx9LVB4qRrdlfnd73B
	 6TzWvHQPDSBpVz8vNRDZhD55xC3Eq4nDbq1NhdO2c7v0HiyJx/Q2a9zD8zKlbwFlT5I8g
	 bv3a5N73XKnPAaXd+ey8BmaVLj8v7ZbH+KYnSnV26SEgSAaPjdx8Vh3LdDA3hO2L5dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vyzSN8YoEpZHNUT3pPheTzKO6EtKkzWYqov5UdjXwWY=;
	b=pygG60bOl+4DUcLTOZ5NsoMh+00kga9QTsdkiPG7MJV/7DoeLsS/jHPKl60Xjmop/Tnt
	 pe9dzX1ifNb1xo/LxPHWNB6O7Pffup9+Mn84Cggmuz579HI03z5L6GZ3os9AISDhNTJyz
	 XrhbW6JQK28k4jQzaL6x/tzTzSEmc83cjUw6szcm55m/0NRNMOXyo4Sdkh/O7/BmeBeU0
	 VuACYBFMqJDpisk1mN0h5SlBlj7PDy31FfxzSdMV7ARGkHasjyaLQTnsELDRNsptxJ9p+
	 RE9S8l47RELEKul5t4bA6HR134tmvPLl2NgY0IPkcsW5VGCnKNGBhFb9bdeFa+IagzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VBU80bct;
	arc=fail smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8448A606A31E
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 14:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8448A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VBU80bct
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-921365696d9so41288846d6.1
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 06:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616607; cv=none;
        d=google.com; s=arc-20260327;
        b=B9yyrXCvg1pO/tjo9XIPpEWnE6ieWigI09JbB/eGMyDh9zkKRv5Xq/bM9t9BNFOP0L
         zmo0blnpNtzMDHxc5S2cpUrXkMcP7PxU91YTrgoIja83FrR0mlkYplleOVuVUz45vKg3
         eQIjU7TyR9GcSEYTRZjd6wyaukhgrsHv/9MHl4o809HmZ2YcGzPCAOwr+sFQx+PLwhlJ
         um2mMM44lBisYVC0ocxiw1XxgPDzmr5DINuOGaKnW1L1i3fIJt3lnd3XieFf/6NPMIxw
         NHUGMJXNaRyUY/KdZelST8atw2+HjGUcRBzzZtSVrelP2F+SHC6ImUB/PqdI8ktV1fZs
         NNDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vyzSN8YoEpZHNUT3pPheTzKO6EtKkzWYqov5UdjXwWY=;
        fh=B9rH5TMW2ZcOi+vEaWOIdtW03Sl/hWXyN6rd2A9DEYg=;
        b=Bl4FH4oZXh2KXBP/YxQmPG0EbWrrZ/rYro2SWiC5SC2pwWggooWFgQ5Z4Z6vz3qm3K
         4SLEPjNgLjTU4VfyH7VgfmfpN9VGObE8z/dqdd5TYVxTCSQ3RwoSUgBaZDQyXoIheHUZ
         DQ2u4RtP2b5IRot+EPSnhJExT+u+9UvVOzC6r96VbOGu+QrwtxgUlP8K4Cmz6AOyoKjW
         efxZybXUe/RUfrw+V0cC5yXzdjCDssGZYfCo5bkOE2D2yK09+1FJrZXmShjZk+3vOUmX
         TO2akFN96LD1oj3g1wNbGKTAKU0IsJfGDMZseCi/OeH5k42p4ts1ugKmIYTyPZ12A+XJ
         bfWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795616607; x=1796221407; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyzSN8YoEpZHNUT3pPheTzKO6EtKkzWYqov5UdjXwWY=;
        b=VBU80bctXVpMU3NOlcb1DlRe4QrHv2umoc7orUqstYTkfK2oNJPvqhDfEXc+OmlQLp
         tj82uCESe7NUS695UcOtdEsBTuLM69Sq7WELmpiKH1jjZx8z1m646NGhXQZZAK/zm07A
         DF1Jz3tj8gtbadlLyO3TmyT2sVvszop32rWYQ0IHt5QGB6QMsowPhYWjB3gGt3b39J07
         zm014mweRk2RbJ1MBQzI7TzC9FPXW/jKNQEBmt2yxinv3gDPYS3h1DRkaS8HC82qVFWc
         Gb5MTF8l+GxlT5OWm7aiSSNtf9WhEz+vupQiw2ncykdpRLj34UKumuxKxjuZFS8iApnA
         B12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616607; x=1796221407;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vyzSN8YoEpZHNUT3pPheTzKO6EtKkzWYqov5UdjXwWY=;
        b=YurV6uAEldukvvy/cPdbfh/btJGLCI2/Tv2kX2abbwzBoMa+ZAAa1K3whlySL6dW6B
         n/wKRTkpwzDu+YmZfTTBTddQOk5vMiJjMgrwVdPuWZL8VHt/9QpGyM4fTuI3MBEiF68g
         vCrOH6ddijRkDEoQqDVcK2on78u1/RJjSDT4gHRM1+vV0fcXu811uvPiWbRJ0utAgnXg
         AR2NXhW1wEULAvePZZaUm4LFUxzAGC7dnUkVTWBQa6sV75eH8Tq5pnqSRAXOceen2Q8S
         qHnrSZcx66vtggyE7jNOM59MVK8XJxFiHR1td0mfpJpcN7SkLEPGsgjZuFn4q2DU+q46
         cy2w==
X-Forwarded-Encrypted: i=1; AL+hErG1NKxXeosoCse6CWbEah9UDCF03qryAPLgcjfIiVQOP3f8uGM8nBFevEPuFGBUgulCpE0+U2XY/3G2zQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dbNaA2FrIqZxzFaE43O3Cu5djKXYpNFr8C4vojRoeUffEnRu5
	S2zRjeX03g+sbZKbiG3qJLr6dnBPiCT1tw7GunCDaI/k7zVQ8yQxEePq0iZmqE8F9qm/xCDsriX
	E76uOQjHNoCPTqS/lRBmsXFDmwIz4KhKXLXYDyxYJpwIbmv4kzKywUxr3tqrx
X-Gm-Gg: AZFdTZdhwQN468OW4W7WI3GmNkPgP88B9sjrgcu648ukWA7VyhVUJxH0PsH0RKxpha8
	6Uhs5ZBuJsG9McFe7qjN+xfoZNQeZOpazzw+/F3h14guUe0jIW4uj9xHWxVhA3wPwLDMyPzhsIC
	NP4NhqIJ0jVxXZXpxsECf2dSf9BtEdFIhMDW+f4zp2HmWSYhlwjCpPttT85u2PI2oi7jWZAkdkU
	2EENwe339A9lbWog9PRu25cVM7yaR0eRFt1dLVivtD8uh5BOcpTKJH+1lsTGKMHdXol7ScC/Gxj
	R4ZYV5YWRneVs0MKQ+wZCqADZHHW3eeHm2tCeBFgM78WuTCan4mZ3cXuGfYgOmbet7+pZu3nPUs
	79RiqnMdStjDnb2p/cI8lnhcZjanroGxudknZz3+25vLA/XHzs90mx2u3AlxYyXkBXAIh0xY=
X-Received: by 2002:a05:6214:2125:b0:921:1955:6578 with SMTP id
 6a1803df08f44-92134984b15mr344701626d6.7.1795616607488; Wed, 25 Nov 2026
 06:23:27 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 14:23:16 +0000
X-Gm-Features: Aa3M54rkSOQ0cxLe0SdeL4aNs3UZrcE3Vu7kmO5mBRqygoNs-GqHDcpUGoDVWIo
Message-ID: <CAA6zWZLp998F363tRSwJ1VuS6djfnGqPDDWjXC3o=JvYkCuOAQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] HID: Make driver_data in hid_device_id a union
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Takashi Sakamoto <o-takashi@sakamocchi.jp>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Aleksa Savic <savicaleksa83@gmail.com>, linux-kernel@vger.kernel.org, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	linux-hwmon@vger.kernel.org, "Christian A. Ehrhardt" <lk@c--e.de>
Content-Type: text/plain; charset="UTF-8"

For the record I did attempt this in the past [1], this approach was
rejected and a series which changes driver_data to be always an
integer was created instead [2]. However, I personally much prefer the
anonymous union approach, given that it will already be the case in
other subsystems. The HID subsystem doesn't need to go its own way and
the alternative is slightly uglier in practice (as you end up looking
up from tables via an index).

[1] https://lore.kernel.org/linux-input/20260518-mod-devicetable-hid_device_id-v1-0-a08e3989c283@thegoodpenguin.co.uk/
[2] https://lore.kernel.org/linux-input/20260727-mod-devicetable-hid_device_id-v3-0-980896ca283e@thegoodpenguin.co.uk/

Reviewed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
