Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96774282F1F
	for <linux-hwmon@vger.kernel.org>; Tue,  6 Oct 2026 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296926; cv=pass; b=oVCttQpOi+peYZvBHXDbJzUPZksrAKI3JFLM7Yi9XfFw2BZv7Ak1MwCBmQTvHMemPxzR0JYyVZwNOQAUPJcdSGPNFiaVhuigr1Fvmf87xIY929A9Ggivg4cr3i0C5xREscj+PtTEHbYNt76ag+ARO+Rli8MIHStHBi3k/cAB4xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296926; c=relaxed/simple;
	bh=87ORjmeZS90TYJ1aF4LdvctsFWMg8mb7HapFxeIBibg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhLmbX1B9qFo6TqOZfsjIr9CrSbmUew8QYx8kZEjefLV9pfla7wneJCnD5Vr4v8FAB31aoU84FsYnosnnhmvA1y0hLweewo2GrFrovTW3fJSOlGZp7N+oJQG5RGUHWSl1L+xUyGLmEsmfFKPZudalxHuvF+lS803pxC5l7dbovk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQgI9n0U; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQgI9n0U"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2dd76b1361dso19822015ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Oct 2026 07:28:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791296925; cv=none;
        d=google.com; s=arc-20260327;
        b=ekGLPFWeqBdYdmkDQ64KUFxmFq14lkmjnQpntDP8JtRATjk2G/aGOAJwI0y3dBSFTu
         M59i5+ag/9aS755fWcwWiSG06JF5wT2YKStyrMSaIj11Oe91aAO21/QXjIzjLb9jmqqw
         TEI0NDXYhrzrhzy1qL3fVHjhsL2Ed5UBi1HMJi6Q6HF0w706fr+fE1Q/CUKqYx4jUqG9
         GzyB6zqin3sRklk3ttO4YxpdA18/vk1Q3JIif/nZzkVlGdQzByz4No6lYvTem3E4rtot
         5eZHeSblx3FR/IG29mchZrsTmABUM7tobZQt6a1A/WXy6N52zihD36f/JKWwA3cwcLAH
         Px9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sNKdgKJfuDIzOlDHBVpcxS6ncuYpdF8HQDhr4gmgvGc=;
        fh=rwFIc3AjCzTtdbq4TeZcsOkqVjPEEgf2IAAFDT0Z2CE=;
        b=Ih9qNUhI6VH7iz6iY9JZJmq8mkmE0WLUwWrUZz5EacUBAQRW1Yq2WINdnbQK9L3f+9
         FOweAwZJKEyZlNSCDqWdRbIs0PGRgffUC43pnFIO8EkZFC0yrV70EjyW4lfsgqx85gbo
         Ss5x07Bx9GVt/43Ooq5HzswVHTrM9PyfjSvF1osNIhn05aKjoe/JwR17RXrKBJGf17dL
         nFHRKRRYdObDVURxI3nU8pDnJh9/Z66VZ6U0gvtL1Nq4x7Z1sa8nT/D0t8QtlYfQJNq/
         35GrqUcov8PzK9IexZyqWcJDhgdqilbqEWYVMzdzDwKF4uC6BZKv8UbcRqrjjVTM2EfR
         rNrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791296925; x=1791901725; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNKdgKJfuDIzOlDHBVpcxS6ncuYpdF8HQDhr4gmgvGc=;
        b=kQgI9n0URkzTfajnld3BicKtIcoyGS8cSVxAgSud0RhhKXRsFWhHohZSOoUME9cblb
         o+/VbAIyTlclA3eJbleFaubrJhHgNgnpMBZqYLzbSGMZVCu5fjk1oTzqLh53vmzDQ7r3
         iRdBmP9bHVEIPeTWTMxJg3V0Kf8Z8HofkdDWOFs2k26cribEMV9UT8zdnCR4OLpJxF8p
         Cl00Ug1E+RPWFipF89Vwqrb9sP0CTTsV+4bEe2Zz7CNBPa5Ls0/y/HH+XWSpmvd4jLzc
         KMaCHWtPch4fe6IDF6EYvPRf2ea2Y3PwPEek/IPrM9BCQKQxfhM0N3q6fidlVmvIgl+v
         I+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296925; x=1791901725;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sNKdgKJfuDIzOlDHBVpcxS6ncuYpdF8HQDhr4gmgvGc=;
        b=CP5YXE67Ve6OAQOq04tMwp4fFGweIYrc/4yXluVh0HqWzF/PvHO3X8/apamIGKJBp7
         UQyyP9pCDGlMz2FGTVMIcW2CmkNvI2SRzLgTWjOxuUqnbe5FFekhwa7l4XBhvVJy0EFC
         CJ1cGah72gjW9EiZNw3p3ssyV4UHZ1Y7wIT0RgYxJGfuhyP6PB+EIWxpiV4a1iXZrGZh
         /bxll0axH798By/UdElv5tl/7LzbltfpUrYBsKWXOEYq2G46vOP0gZLZ5LSQlnJPaF49
         z0fCCe4zqBOvsKIkAz3UPBsWNqmYS3vKd/HpuJ0daJcMNCa4sgMOAK+hRmgvubwIC1ig
         7WLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxNB0/MGTdM6VNlpBsj6RrLWs4E2vVL3Bcj9J9z8qhVH18R3mIEqGdS5G6fyFKkvKLOsmJ+44FfQ6wGnw==@vger.kernel.org
X-Gm-Message-State: AFuF++maUo3SjUmcDBEP7EMptTdAqAWEZHRNoBmGnWCYXOD32VVqRUFS
	81eaix/7LseNQjdgARVDirxpu1HWOFsRbUhuzUihaTM68UpLcJRKXLOBMXylIeVziBxdxmQp42/
	3GAgio0PzX/Crj3QBDZpeI85T7tzFJ+U=
X-Gm-Gg: AYBFou0M7k6njdI+N23KP6p1NXOsu5JuVvsq5Ozmbo/JK0rQk5TgZQnn8lO1y3dELJk
	fuBnKczhVsvE8vRepkK8ov0J86LqSzsVgwyBrXZZU7FKBSNERw+JpNhy4EXihmqrBwwhH/MPNFm
	UF5Ioktpcob1aMMRek0+2p0L06JQkPkF3KDjO3HLE5uD5tHyxqfOXhBBO+MfbEzlF8QR1yQdWEe
	Zvp4PaozvnLEGKHmlWn8n8Hl/X2FGqQJHmAZ22FGO3gPkFv9iLZHB5AqyWe4otjTZ48T0kNlYzI
	bskM29D3Ogtz1vobEEuTZGdOSg/ONxLmTh9tBMGQLdwfWWRxAJEdWjb1vBiSs4oACV78AtsgY0n
	NRMsWTzkOeOW/z+gyC9k=
X-Received: by 2002:a17:903:fa7:b0:2dd:c100:4248 with SMTP id
 d9443c01a7336-2e5104fcda3mr92782805ad.44.1791296924894; Tue, 06 Oct 2026
 07:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-asus-ec-x570e-cpu-opt-v2-1-74df23c22f04@gmail.com>
In-Reply-To: <20261006-asus-ec-x570e-cpu-opt-v2-1-74df23c22f04@gmail.com>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 6 Oct 2026 16:28:33 +0200
X-Gm-Features: AclHuK-hyLPZ9vVLoRuEwnojL4qJYb0qoBFxRmZ2Kq3aqdU-d3LnXzx9-QGWZy8
Message-ID: <CAB95QATwqKoUPF=w7jQV5CYwTNBhcU6_vn7q15GL_fUWNGiefg@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
To: mdlayher@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Matt,

On Tue, 6 Oct 2026 at 16:15, Matt Layher via B4 Relay
<devnull+mdlayher.gmail.com@kernel.org> wrote:
>
> An LLM coding assistant did most of the work on this patch: it found the
> missing sensor while auditing this machine's monitoring, compared the
> driver's board table with the BIOS hardware monitor, worked out which EC
> register to read, and drafted the change and this changelog. I
> reviewed both, and every test below ran on my own machines.

I believe the Assisted-by: LLM sparse tag above is sufficient.

> Testing:
> - Runtime: the same one-line change applied to the driver in v6.18.54,
>   loaded on the board in place of the stock module; CPU_Opt read
>   1454-1463 RPM and the chipset fan 0.
> - Build: hwmon-next with W=1 and sparse (C=1), no warnings;
>   checkpatch --strict reports no errors, warnings or checks.

Regarding the testing section, I would suggest removing it from the
patch description as well.
While the testing is thorough, that detail is better suited for the
cover letter.

Otherwise LGTM.

Thank you,
Eugene
