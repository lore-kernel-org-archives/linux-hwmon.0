Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465A21B4F0A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Jul 2026 02:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784255648; cv=pass; b=U2ry7fe9an7RFTxsX7o5c1WU6iVUaV+AwKygqVH34D8bHNH54KXORJ6McA9spe+SqGXES3eE3FWZN+PQ4B06oRgxli/TOESqJ1pP5rXN9fpHIjoQTS9Gv+kV6BDc3MXm3vASEyiY2G0x2bDwCh7mQF61OGkrwVnIyvJEpDqeYhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784255648; c=relaxed/simple;
	bh=T6g2xySL7H1XuZiwkBcKKMi++o4FkK8ylut5CU8QWHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgRSBjODyqUIc8fMFdpoE8Snm83f5yol096NpnnJgep0S4uXICZw559Ivtb6qUkVhO3xtCQqhV3e+ZRXVkhCoNRE+4fkyWY8KXtKRllRynq4XuSQSo/4H2eLGK7mXp24fLeYQgf3DxsizWxVtVv0BfD/ZCgiI4QS9M9MH3t/cQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9ZlUyFH; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9ZlUyFH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so13743684a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Jul 2026 19:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784255645; cv=none;
        d=google.com; s=arc-20260327;
        b=DtfHSXrQXIAOmu11nZNxEBDaNP/FQ4rLxB01Jjo/LZLdg4NG3MSZadistAEkDnxN0X
         YREc2b/FsvMQmMN8wLP/v5jKXADs8Z64WwqyN2M9TIppSyqb875uuUrePxakS6rXrA0H
         PEwcnQxOBZS/6498zF1pGQ9i0c3ZCFJ9rKhAyJe3HixguObeVdS7lE0ekYB0RAC0dGMD
         1QD9KQOuzcrVP1VpIl1EYi190ARR77waOuPOH1pz3WgAL8GLftIRaT2M86l6/7BkdTbZ
         hu6Eh7IoMleZwk6QzOptAel/TIY+K7AzFQ1eAFZqqHAev0jquKbBYXMFwWNsZuqDgIdT
         tgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5f+tnduvJaWaCpIFHTrPdllP/FcnjSU7I5JwS6HOruA=;
        fh=VClhrajg8utaUJNER+2hJ9Z0kNCP7rJqUyGehvzZObU=;
        b=U+HcdjLYAaq4EDo6Jd7OZmbzej9/LvgfhBsxKEpZ9IcDaRqoIyGYrAMOS3SCHNEVXL
         DaJ5H/RNodDOVzgwk/CJouacp7P+bEnyg9MUunazvKwnQ4nfXoJlcA/Lr/Pjhybi+Y1k
         d/7u/vhXjSE8q72K91myg7bJGAbF6h61+Osu++MBzp8qse/zy1S+6PkpEtcKQI2Py/6Z
         aYz3Vw5ejHY+WQ6pLa4dHHbE0Xw/6J13TEg0vaZ/Du3YgoFa6uFDAyC4cYIikA705RiQ
         p43+fjFnG9Y4nQfPPIW4J4Le24Ps9psQa9fuxUS0JPqzjKAefjVUUI7Ey5KPRlf0yhs2
         5FRA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784255645; x=1784860445; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5f+tnduvJaWaCpIFHTrPdllP/FcnjSU7I5JwS6HOruA=;
        b=h9ZlUyFHXGBS+PuN/QsEQY+2MgY9wTHbzucQyKss6aJ3maEYWCwjjQGQ6otGb44D4p
         ZFqGCVLB3FoNd7fESa4GikNF0w6AGOG4COqoBhRKpxiGvlDnk57wXwX9qcqe3U5vt+jz
         c1KhtQYdjPEhEKfU8FS4CZvgGs10r5psQKoPJaQtB/166oMK/rMbudJaPiSoaUzKVEuX
         M1jOwot/DFYkkxdB56ANufJn8Ls6FSO4d1/r2d21NiaelXJdNgIuMuuW73D832PwTDCL
         +/AyP8LVu4Nry5eEM7M8XcM0mfVr3PB+fE8Dt+a7GyqA7AxAE7IJGpiQdHfHZvJVokIO
         Ro6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784255645; x=1784860445;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5f+tnduvJaWaCpIFHTrPdllP/FcnjSU7I5JwS6HOruA=;
        b=ps4mgFlQhIBgKT28XWt4yzjOUCbZ2UX9AvRw0SfhkzF5bz1YkJrvfeA/w7y99sKD/f
         O1+imm+316In+iTNWbfVNDvUsIFC2hoEF0I8NvoZ4TJhE9HgbFUm0C0nurZ30TRwOOr3
         XIuw2D86+RurRhrx2UfvoAKfc/KmWnX69pEwQmW3WMS9Wbd0kh4Lj2RjKgHYcsMT79bl
         AhZCkTM9bKJBsVMr3r8JbBCRd8tP48nFgg7pPystfjvqCW7ybpgxLUMAhEclJrqpoLJe
         tifWvN44+dSO63nDUn7NVaWKld0goXnbDdBGLgLvNa2Cu2JRnanUBhmQXNv+cPHl+Wu4
         anOA==
X-Gm-Message-State: AOJu0YzElxIUvJMzyTXDlqvJgMV//MD6I1dAfCMqRULaObssuJMOeG0S
	rhAS+a96zkO8hCoBimsgQyuJhuCWLa20OSlx+0iuY1GmCa1AbjS+A1CTVYzd/Xi+xgT6HsYmLw3
	D4cCqDoQb+lyHCoXOoqxDzrL6SXgNoMg=
X-Gm-Gg: AfdE7cn6PEPE4gEgv3t2HwVObVLWStn7srxOtna0ysSyOy5FLI5xmDT7AgNCOuD4ixt
	X0atFHo1F87xmc94mIfTzBZ1uDqb8k2gL0oHB745dX9kcvOP5YCAlbalOy34BP4TOxqQChKuziy
	1rRwFJz3pffXX6486OLnAdgfcQYAdPiccUT6Je+tUHeQBtaKPZYR5jZ6+Agv9RPMBkqPqJom9Vu
	Xi8i8w6JV2tSP8y9XxeUNq9iQmoDeG0gIaGJva9fbfaVtf8766/WMlrx75vaQH6H9lzJG//9slA
	H3wxQw1MPOC11YAJkA==
X-Received: by 2002:a17:907:9283:b0:c16:2a:3c7 with SMTP id
 a640c23a62f3a-c16b46b6a05mr18468866b.11.1784255645278; Thu, 16 Jul 2026
 19:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-adt7470_thermalzone-v1-0-cc55ef35edde@gmail.com> <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
In-Reply-To: <20260716-adt7470_thermalzone-v1-1-cc55ef35edde@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 16 Jul 2026 23:33:53 -0300
X-Gm-Features: AUfX_mynEXLOUd5w6q2sgv80ierrWkqiVgimRXkDfEJEHNvkVSEiZxmqVdqqbko
Message-ID: <CAJq09z4C2R5syGVtBtA2p6ER1XWRUwaVfEeL2LPvupR6xBe4cQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: add binding for adi,adt7470
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, de Luca <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +  "#cooling-cells":
> +    const: 2
> +    description: |
> +      Cooling device exposing the 4 PWM channels.

Since "thermal/of: Support cooling device ID in cooling-spec", I could
be 2 or 3. I don't know if I should use enum [2, 3] or just go
directly to the new const: 3.
My test device has only the 0 channel in use and 2 is fine for now.

Sashiko also asked to require #pwm-cells, but it would mean to
implement a parser for that too. I don't know if it is worth it but I
can do it if needed.
Regards,

Luiz
