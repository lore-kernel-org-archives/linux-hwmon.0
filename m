Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756460;
	b=hZtGRM8TuK/iaj7T6PgmhC8vYXi+0IX1prKSYFyQhJEa37n2TEl605L7oeQLOS0PPygT
	 h1h4s4w3OfNiKZ9e9PiqE3pQr53HUa/GmHURPmD3DGrvFaL/S83+aAE5ZWo/06AqeM2La
	 UCEGLSj5x/KWdnBjZmNEtlr2u30YWkjn+BE49f5rQegY1/f3WXaQoe6H1SZi5rwoahJ7j
	 dhX7jUJ4R8pprjF6tEyQIiXuXgkp1RHNS/0UL6aH4Qlf9GCni6vU1W8mQ3vEQCYaDodJK
	 0ZGolbJMe7FlpubRntQYCkqOWdtuD/kjlOitCsCwb8jTcdHMkjH67uIcz7TngEua7eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BPk/BlkpSjsU6PhXk5sbl5froZzbUVsLM1nv2qWUBJk=;
	b=bcqmy1wGSBghRKW2NtgfFB88SAuqE4fslPFhq1yRIL4mQre6Cv659HrcQ9fcFpzACHCs
	 3W5emEx2p5VK7uSJ2crmHGCvMIgDzzvLjsP89IW0UOAPvNFt5n/qg1KS4ec5dxbB4hGDM
	 WUebQopQ9mmA1iuJ6awTI4W50e1ikrCwNqqjzq6sH5VxCXEsDlGQHQb9BzL/zcfNMPeg4
	 ZSiY0STXtIMuuiwK+OfixkzIqwgudmdaMtI07IRq7Ujw+dkWeIDDy9QuvrKA4TkESYRUq
	 zVlLmnlerVE8JInCkfFx4SnhS4C4p0SV2rSCYFNaAngKuj8Jl96h4AkaTKjdAgJn0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwyFnGZg;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEB606A31E
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 05:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FEB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwyFnGZg
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so72286035e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 21:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756459; x=1796361259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPk/BlkpSjsU6PhXk5sbl5froZzbUVsLM1nv2qWUBJk=;
        b=GwyFnGZgh+G3wJbuIosavkTPnUJEAPDb/zZq+cmHIEhebOtGDgeifD8YXQBjOCJiFW
         gfSbZHRHrmmg/mvGSB4DGbEhlQ51IQtdPtTtXS4RKnCH0EEX80JU3UczuMUlKRffm0Wy
         yroaQzQiuQj5MyZuJDlK1D2lKVlFxoMvwg8cJIa3txkAV91lf5K1W2P8S6s7xCQhAVQ3
         22LONAsiNsxlCL7+JPjLAm7OxB1/inPS6anh1FXNE2kzW9NOIVfwnAihvz1GuDhvRLhN
         +aeJzvQAE5E+FGwmsreFK+q5gBRB+fi62ZUgb6WfnqCd0h7eC0S7s4nAKlqdlvB7Bx7H
         U2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756459; x=1796361259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPk/BlkpSjsU6PhXk5sbl5froZzbUVsLM1nv2qWUBJk=;
        b=RiL2D2NdwEYTA4fXetwKj+onN2978pSxBlpgQZW43vSEjIjtUtZ6kWPJ8bc0inlHgY
         4tEsHpz3zgC8nnA4Auyp59Xwzg9wwjp7wXnkzKtsqT4cacpIoczPdKgDmPM0C8eDRLoZ
         ZyhT9bXgZk7Od1ZKJtoWBiaqqItkShBNkmpAPniXoIKSSzchZa/cdTlaYnVRPYRdTmZW
         VRfC+FTj94cwQ467bzw3tIo12YM7m7K7tX9qUhq186095lIPPm0Aea50l+FKovV23nUO
         zYwKh29nubpiHmyam7GKABpcI7Z0Pg02znamgcrZ3wSpKED6XMHiHJpaT2RUNQRqj0qd
         U9Vw==
X-Gm-Message-State: APuU4Z+SBoUKaQL4FGyVejbYT1X4CmymlPFo/8+30UAx0nKmKvpW9W9Y
	31RdGZJSOmCzbIQ56eSQMoCrXJ0hUWmpPGTRIQM7WLHiXCmTNY82I1Z4
X-Gm-Gg: AZFdTZdAM1O5nc75NaRdve2U5F74LdVbj19F2mNsd+FJHpBZnPECPYwsj3dlI1x4kmJ
	yDn9xWpvCjd8lb60Eqcz2rAVlnVZLcXT7qVa558yMGlaEywyhzF92Ek+Y5+qaV9+k0u3sF2gZes
	VXxS6mxlVrVj5psSMIjWFAd/3zKTA/HrN3erw0V3XKaoZA68EM4s4wCj3iEOkyyX0hBUBSbrEU0
	PxMoJQltOX6N6ncJDJJw8tYjM41oAmuJMQy5IRxSClOtvV9slFFGct6sv1gV5mmcsa6eXzDZMTn
	dUGmw8tK6JtqT1lpy/sxlHVLhq6ZqxjztSGQoyvpSrnc56yuyV2fakg1gOAtnCKTJUvnkOZh+AR
	t0ovKe+GahkVyvCIBlfuO9g/+luk6avcfdqwNLIL+spvrnDLr9hiSYVFJ4DhDY28L1ZnGFKjcgH
	Uq5qzgXoxPR+uY3F7UWJL0LiJhDnh9zRK/ZR3G0D9OzP/WAaQdINXymvyrAS6MT9W+3fWAYEHhV
	/40Ugfp9zjSQGLeKpJCmP9mFZyfhxmP0+EdVbHZvVQB3S7+Vhjcza2aPKoV/WGmvhtEPf9iUPlP
	C8K1CEVV8yqxLonhTkDvueMVinN91d5akkhbyH9JUL3Ah/7Uvxq5XX8xC3AvqXms3VtF4ljAvbx
	sOXxgKmzs+qk4VLd6i4403/dPj/Jscjr5+RX2g+NrMAPFKT8apPtg3GwhihyZyp2/WL5mP97ieB
	TeqSRIEt4muTw3p8O5F4AkBrM4oTbTbKhokNKJWKJWXMJ+f3s0tOvLUOqb7jL6AhZCXG1XmcbSb
	2JdYvZGt9aO
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr454605605e9.20.1795756458767;
        Thu, 26 Nov 2026 21:14:18 -0800 (PST)
Received: from sergio-82n7.homenet.telecomitalia.it ([95.236.10.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm641372085e9.8.2026.11.26.21.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:14:18 -0800 (PST)
From: Sergio Melas <sergiomelas@gmail.com>
To: KuwaLee <kuwaleecross@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for Lenovo Yoga 9 2-in-1 14ILL10
Date: Fri, 27 Nov 2026 06:14:16 +0100
Message-ID: <20261127051416.479623-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120230744.34942-1-kuwaleecross@gmail.com>
References: <20261120230744.34942-1-kuwaleecross@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi KuwaLee, Guenter,

Apologies for the late reply -- I had to step away for about three months
due to a family illness, and I am now back and catching up on yogafan.

I verified the ACPI DSDT for the Lenovo Yoga 9 2-in-1 14ILL10 (83LC) and
this patch looks good to me.

Acked-by: Sergio Melas <sergiomelas@gmail.com>

Thanks,
Sergio
