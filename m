Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29D34E75D
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243966; cv=pass; b=VfbB3/NbdlPnD7n/GaPJUqlnXt50pjpM4d/u64jaVvGgg4Y7VvMQO72eahaeKMk3xGpApZdtjmPkoGpF22uYXN9Gt0Io/G3ybgSRwdK1foNh4Yb/MXtECX3YcbhZDvuuknBAvI4TaWiTRmInAojzDDLBhvR6/SpClNQ9NJX9i1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243966; c=relaxed/simple;
	bh=uyJXmRRMshDvjiZO6cN2BesCS7EeyFK1l28FQvgs7LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jnsb6+7Z6vxg2RZDHctGS6Ea4GiVDMvQ02DdRx03xF3xRRRuc/h671+g5KTXADMrEtndw51CJ0sLz7h9+0pwxwzW4uZVGHD+tfXfkUQNJx6zkSn+n7uA7CJDq6VbJSyzO+49GzFAFPPi3y6XHyvjzgPsESEuKeXvHqR7AiSylZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iznOEcuj; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iznOEcuj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1614804757so763406066b.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 16:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784243963; cv=none;
        d=google.com; s=arc-20260327;
        b=MvwBuF1lrC2URvUhvYqPINTVSNHj1bTyS2bwp+qJKC0Jc5OmciOiSJOUXQXneONiDn
         8v1dDKTOio0pY/7Y2fCeMdF66nx2ns7suY83KiY1fwqryQmqk/XB2CAstR7uJQcZ3I0g
         ikNfpXFxw1eUdmYVqgV0MFFdo4F3L9PgS9iEOgmuAOK55PHYca4RonWwlzzdOsdPnyYk
         iBx4Bw8FXKpqF1qj0bI1/gGfBto2xnZ+me3j+yj85PdEy0pEPeYzAlP29ZqyOsw95Vna
         4VrRqOIBPl5yuBCrNhY1UoTdqvucbOD9mcstC5nvBQLt/S3uX3+YYS5E/JNy8uONGlqW
         kbpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uyJXmRRMshDvjiZO6cN2BesCS7EeyFK1l28FQvgs7LA=;
        fh=LVdT1jqc37h/+c80Y7kpV4E3imB/bsqUx5YbM28QijA=;
        b=JBJinQQFL8ephv+6xwYid3fwjTGBEBx88XrYyqTq+o0R8TaCgIqvg1TxhgYZt0J1W8
         WV0/aTHqU84SUGznHnj6la8fCXVSHAfCwIaq4+SJDDaoQU35Ql8/Bi0qsAEuylCN9oej
         c2t9lBboN70HFPf/0yrJwLBhxeVlvPd3wx+9QMEjMQzh1XYVjchPsAVu8XXVjpHI/UiM
         5bu4juq2ulEOazRQYgVGbGuiXnUYoHBon/NtUNVOmVyyUyUZV9Mt4qY0bVpC4kaKuBLF
         blqjIehJydSGFTYYqY1CSWYC7JPTtJypZYmL096O+bYUaZ3mrqJYcmZuZlOwUc/kWHXD
         gpuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784243963; x=1784848763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyJXmRRMshDvjiZO6cN2BesCS7EeyFK1l28FQvgs7LA=;
        b=iznOEcuj8rmMz8yb/rzwIJIe0kmN5f83Vgvu+J5bGux+DCbO2R1P/3bwiNTrVeKb/4
         vwiMxFPwaaFSfKh2Lm5fRNCYeDp9dbVnJCi9jUMpGilBeOsUkUclavQQKjzYFj9C+iNb
         3hJCdcFo8BIlq01f32eb+AFatDULzDncT41IvMWa2qSI8mWuAqAtvSgikvV/Ci2nJezb
         WPqVD9sP0NcWsOkAiaDP20PadrgEKKmTX8XiGOVGXKT6oWE88r5lVVTkRLrlt422b7y5
         eZJZU34nVlnhc1FH0YxoHCsaJk3OoGe0NfISi3WVM7ZmO7Yl0Ur5qM2QSV0/i6XnhWHL
         gyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784243963; x=1784848763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uyJXmRRMshDvjiZO6cN2BesCS7EeyFK1l28FQvgs7LA=;
        b=q0aySoLk0RboeYMJrzkj5aVk+jjP7G6XVnxz1AnzPoeLG7j4PQn6t1vdgdqn9L5LVJ
         O6nGJHtFZgCjGVOruXKyxPzv7RhAUU/F3pZsEgOCT1TP9yDBK8tLAahIkVN6ZPTh+Ebk
         tsMJXe06uPs0AO0wgTgkmLkNHrjiF8S1KsMOo0y1cp6v9tVwpSD9qEKLSxe9JkCy6P8j
         Ek1YfQTYUluFL+bx/ayeLJN1HksZ3C+hIjoZwnRcX7BQEO1Pk5+u2vff1I7qe41QIeOo
         DaR41awTyKtfBd04LmweN8suGcPBH3xBYtdondIaAPrK2VWGiqTVE7UW9+EZcpKJp0y5
         FaCA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/2vpVHXPV2LRqEVq0nOGx2cFbOj1Lsjcf32Sv8gsyBKhwPGLuP908FCGluOJq3fYScgAfJYDOwmAYEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2eteWV9tzIE+tjnutaHQopgl/2wlJ3ZGSLJgv+qzNF6pOgP7r
	29FMGesvroUxH8mMmfE3M93Jr/CkKBQK8y5S33u3XpqBFTaoHTOs+34gtzHNcsV+adTNMLj8Ejw
	/pT8V3T+TZh47ULTDZ+/YlX0+3DPLhy0=
X-Gm-Gg: AfdE7cn2psrMtW/+g+V6FCZT1mTj4M9M1oiq8hIpqtTZjJlzQGi3BieSJhoKpXQQ1jQ
	7injXVpiOiT6MiJRIEaduqzxEZufytvWFG9azl3zQJBKeaCbMApWBaI13Ra2yKC83G/h/+i1HnV
	r+gyzOG6RXBjtmProz/h4WfGZnwAnyUaK5qBBZtl5h9uaKKVAHuTnL+cAQJTw4KAH203ScN+UJO
	aGlfv0BCXHZ0TN7lnuwZnfWXHJzf5JNwx5aH3TrIk7noTIGaqsuFR8gcUQ+np8=
X-Received: by 2002:a17:907:ea6:b0:c16:7a4b:33f1 with SMTP id
 a640c23a62f3a-c16b46f1897mr698466b.21.1784243962703; Thu, 16 Jul 2026
 16:19:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com> <37ce18e8-d505-415f-8e01-0212840aba8a@roeck-us.net>
In-Reply-To: <37ce18e8-d505-415f-8e01-0212840aba8a@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 20:19:09 -0300
X-Gm-Features: AUfX_mwK5VuOmHvoMP0uFeSdkNaANoazR5d6lJ3OOYaAQTaktqQU9CnX6D0mCKM
Message-ID: <CAJq09z5r3mb2bzMkQbAsRpg3isv0NgcpCdamkuFf7v4MyCOSng@mail.gmail.com>
Subject: Re: [PATCH 0/4] hwmon: (adt7470) Add thermal framework support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> This chip is 20+ years old, and it is very unlikely that it is used
> in current designs. Please provide evidence that this code is actually
> needed and not just a coding exercise.

I understand. It is used in multiple Edgecore switches like ECS2100.
I'm preparing a port to OpenWrt.

https://github.com/luizluca/openwrt/commits/ecs2110/
https://forum.openwrt.org/t/add-support-for-edgecore-ecs2100-ecs4100-switches/251818/10

Regards,

Luiz
