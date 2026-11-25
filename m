Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630594;
	b=kkkYJiLAJx85vGFy2M3/WJ4PPOrECl3IQCs4tdx2fhxwNrl/2w13syC1JK3ndpR3+n10
	 /pcUZgX4J29ysMLUayqn7rV0G1hjL28o4F7XewAB+bYbb/Kezlt4K8UxmMD35RBlBRgqW
	 FZ+u3dOJDnbtFj1h6UHXGFjGcgCsa7m2em2ioqWyVSWxlq0xpUH/9jomoJlMI1Jr727zH
	 XRgbVNJ43JcivuUYMTH8U7YI0dkk0/UpiIFVUVNBsgGJyt4AgtRFSCbI8tyECzrxySJMJ
	 h9NM3h9nvvs/b+KrEZKSgqL8JlD4XqOXHEfF6rURe7wKxyRZfj/I7OocWKWgzj2jKdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CjWm5/UHo+r5udk/y7h+H88lRIb30cpagGaa9Im8Ykc=;
	b=xUuZQATIA6u2+eqPHk/kxw/IZaYYSfP1bZw9lZxa6vetHMTigud4aYm/Gb0A5DhblIEX
	 OrjOVof0IK/LHxQGULYcFWopRrEl3ylqOaPeZvOmFJrFjUnve39/X8kFiXck5MWGy+2Jd
	 dpYFYKaCftS5mejQNf+ghbWvBDy8cPJAuti3TyRsEK2fMmOobJEs65rDYeh4KiM8NMwry
	 BGxB3kx8tiOb8zWuPr5fUR+AgVdoqvFKFU/UwOr9jQmbvJXh145PJh7iM+O2VsOoyntbl
	 KwaLAKfmMnhkLWLoG1KLaxAUqKyfCN55UrW14CGHxr1EMwqnKzdyLccaEhYPoj7RO6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--akorn.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BqxyqwGM;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE65606A33A
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 18:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE65606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--akorn.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BqxyqwGM
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso5385625a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 10:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630594; x=1796235394; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjWm5/UHo+r5udk/y7h+H88lRIb30cpagGaa9Im8Ykc=;
        b=BqxyqwGMJO2VUldfrbpopycm0DqYVRj6nCjpTlwYfQHKx4EVSQgC/BPT6P1GeUJYkl
         C2QyWbVNnxNM/kquqaTeEcXdAo+7H2Uh/aEVad1DahUmzzUZ8rqOr/BFhKLY1/XPid4d
         /ncQpgex4MFhNgE8OgRCStz/sBZYRZDS+O2wI8UzV8xXjFISvcwGiccfQAjzay5rrfuu
         wCs0nhtewkPANlJFPobw6+Se1aXOgvxkwX5HML09xayqi65zHOqoCQKIVBriYsoKndC6
         KIQfPl2qNhwVNqrYdprf4lQMXiqngkv6xtbXC2Wrbh/sLRJ8vAcwoBGrLxadxwC3KLEi
         p/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630594; x=1796235394;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjWm5/UHo+r5udk/y7h+H88lRIb30cpagGaa9Im8Ykc=;
        b=BFLRr0rzvws7PJ5tUls4GcekxLYMKLGFdXmSmlLFXj4IG7UsAbC8Qo0i+NF3B6e5Qr
         hQ3HqWv9Vp1t8HdUfdDgmiIB0v+HL4U+tyPbNODjQOwUS2qfOqaruF57f40mPpK7aPK6
         9jO13e+iImoZN9LQqXF8OJOOrnYKtmsA/jnPu4Vf0fVwmsr4zg0EalTiikEyjIocB0Dj
         AdS9Nlp/WOT+t9LdExgB1YaF8JsqpKYem1C2Px2g3cPdfI11y25BPEE0wpYe5SKSfsYl
         ayURIO0IbODrvSLJv6sTN68j4Yy/+/8MuwUXqmd8uRxjATq4amo6I9sGZgdpiWBkIpIV
         Nowg==
X-Forwarded-Encrypted: i=1; AL+hErEb8/ctCvOjXuOGY8F76NdQE4wx/bG3HiOA1Jhjrh5Xp8GJgR42rSSueQf5NGphABiFdlsAiDt4bqDcPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+SZwZoOFmCRF05byX1N1iD5dNzh06mKwMMYIKsPUyaLM47s2i9
	B5pkXIVc2B/5PoDZ7DyAiOBTcGcR9agwo8d+BVzV4/iLCn6nmXFbUlLLy/N6K80UHytfwii8QpS
	r2A==
X-Received: from pjyf11.prod.google.com ([2002:a17:90a:ec8b:b0:3b4:3d61:7517])
 (user=akorn job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17cd:b0:3b0:99f8:eba8
 with SMTP id 98e67ed59e1d1-3b41c97c45emr17900418a91.66.1795630593453; Wed, 25
 Nov 2026 10:16:33 -0800 (PST)
Date: Wed, 25 Nov 2026 18:15:44 +0000
In-Reply-To: <b5910c74-7e29-4138-9dd4-030c95c78ec3@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125053711.3098007-1-akorn@google.com> <sashiko-outbox-232631@kernel.org>
 <b5910c74-7e29-4138-9dd4-030c95c78ec3@roeck-us.net>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125181605.3299785-1-akorn@google.com>
Subject: Re: [PATCH] hwmon: (pmbus) Fall back to CLEAR_FAULTS when STATUS_CML
 is read-only
From: Arthur Korn <akorn@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arthur Korn <akorn@google.com>, sashiko-reviews@lists.linux.dev, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 11/25/26 07:53, Guenter Roeck wrote:
> On 11/24/26 21:49, sashiko-bot@kernel.org wrote:
>> [Severity: Medium]
>> Does clearing data->has_status_cml on any negative return value from
>> _pmbus_write_byte_data() disable STATUS_CML write-1-to-clear across the
>> whole device when a driver exposes a read-only virtual page?
...
> Seems real. Arthur, what do you think ?
>
> [ PMBus is really annoying :-( ]

Confirmed -- Sashiko's finding is real.

I tested on a system with 30x MAX16600B.04 VRs driven by max16601 (which
sets PMBUS_PAGE_VIRTUAL on all 3 pages because the chip NACKs PMBUS_PAGE
0x00 and latches INVALID_COMMAND):

  - Page 0 (VCORE at addr) and Page 2 (VSA dummy client at addr + 1)
    both implement writable STATUS_CML (0x7e): writing 0xc0 clears
    latched INVALID_COMMAND | INVALID_DATA cleanly to 0x00 on both I2C
    addresses while preserving other STATUS_CML bits.
  - Page 1 is a software-only virtual page exposing vendor registers
    0xf1/0xf2 (IIN_SENSOR / TOTAL_INPUT_POWER); max16601_write_byte_data()
    and max16601_write_byte() both return -EOPNOTSUPP for page == 1.

With v1, pmbus_clear_cml_faults() hit -EOPNOTSUPP on page 1 and set
data->has_status_cml = false for the whole device, causing page 2 and
subsequent register checks on page 0 to fall back to CLEAR_FAULTS.

In v2, I moved data->has_status_cml = false inside the readback check so
it is only cleared when _pmbus_write_byte_data() succeeds and the readback
still shows PB_CML_FAULT_CLEAR_MASK set (the read-only STATUS_CML case).
When _pmbus_write_byte_data() returns an error (such as -EOPNOTSUPP on a
virtual page), only that call falls back to pmbus_clear_fault_page(),
preserving the existing behavior from d9d30e1cb9ca.

(Side note noticed on the live MAX16600B.04 system: untouched devices boot
with status2 = 0x0002 / status2_cml = 0x80 latched on VSA because
pmbus_check_register() and pmbus_check_status_register() pass page = -1 to
pmbus_clear_cml_fault() / pmbus_check_status_cml(), which targets the
primary client 0x69 instead of data->vsa 0x6a when probing page 2. Happy
to look at that separately if useful.)

Sending [PATCH v2] shortly.

Thanks,
Arthur
