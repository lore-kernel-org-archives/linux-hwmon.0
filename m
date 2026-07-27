Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7629D3DA7F8
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785123909; cv=pass; b=D1HbiG+L44tZR7zS/xDw24KEWQIIlGK7DlDmPYXxKH7hAt6JXYhUA2WX6Y7QBMslgbmgpBi/HEnE9lYRAgTnsw0NvZXpDZZJeKTeAv7FETgg1f8ncQQjBTKvN8z9L6f+2ePG40UFIn5XxCGP4PDyaaoVrlu4MGAEVOwUtPfpQHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785123909; c=relaxed/simple;
	bh=BdGAv8BxYXdTzf4sT+8+9cY8v4UQ6f5vnljwVuY+ezo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+DRVe9/u06SXxllXU9BrRuFJ/nqOULWZAP9iDJpqu+KmzBWdgZBQD84USlJjyIetg7+3rvkFKW5NNCikficVeh8+f0a9sDa/82OlEvPgsSDtGqMFHS6eEO5E5YSG/7avyA/+ERrVgHAgewXHhGga1LgFTg+ufE0Hc22RdIR9Q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rVWpX37D; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVWpX37D"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-44aeefa1c00so1799080fac.0
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Jul 2026 20:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785123907; cv=none;
        d=google.com; s=arc-20260327;
        b=QRVkXuI0M3XztKLKJqi8tWlQ4su6CCYAQd3ls0WRtmMTZ0hpi/X1MHq2z8dgfFDtDP
         HXKE3SVDorSq28t5/8LkwiPMGuK5w1gSJJV/P5TocvGNT7whxlycDMf+Mil4wRF1D8JU
         cvo0wbrouoH3wU++OSBogruL6bIW3mNuq+nkJTTxQVI4i5LBwKG4aI/Drov+3Jej2k9O
         C8ByLdWshXBJZIQnLQWgNXImEtm5mysDVJZ3fqOAccbFDgPdIo0p/wd8KrSk/T7NG7uc
         T6gAPI8Dqm5EcWPBsGgnyWqkqXx+bvY9Ca1G31IN1iBupoDy6OT+EUzEraHDuBCGDPCb
         Hmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BdGAv8BxYXdTzf4sT+8+9cY8v4UQ6f5vnljwVuY+ezo=;
        fh=cjKiCGKDwXfQfA+Opl/7wmC8sW8R0xFDXvKb9vYo6oo=;
        b=TjzEcv6qkNkCa7kag8fk4ltblwqWIlIXqtWPXo0gwZh+aHEIT1IPxcqfV4czSVjmNL
         xRPBRXhWzAfZPuIkQPVVhqokL03Zvuva9nXcKsuJ/ZewAH3OLHcYFlN3arSCGnPkJBpe
         WQaCvI/nhdKooCXq+mYS3Pvum+lyXcd97+g8vGrVnsHGorqpvCP9ISCwtoHl8pgpmTPl
         i/R348uUF1C793pqYvBEdpUJjxxvRGMQMx57VhfyePZG4i9uLzI7/dhwCJqDojgfG7qp
         qDjOYCw+ioICFg9z6p6fy7S88D7jv68WZrvXMBq62WHoEIeWmpud17MVGggm4YndFLi+
         0g2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785123907; x=1785728707; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BdGAv8BxYXdTzf4sT+8+9cY8v4UQ6f5vnljwVuY+ezo=;
        b=rVWpX37DvSZA/6aM+Mgdimn3wG6mwmBu+UOP4iqwkaiNSdkb2kwDUCp5sM/9ily5DG
         d9ScAv3AEzJEjv6gENZF25gwAV7jUdYSJb5b13pG7/DtO3qaY8dlVpSA/ZWfycUA/YTX
         jg7Ahh733ucmPT3+PADouzGM699NQYPyNsXefBRtHh5fuEFmGG8oaEaoFHKcsimc9TXV
         hLZRNuoEOlNQ6wglE8DBhJ6e5b+frz9p7KZWTkBqMxJiQ193qxAQOn2kXoRMWuBDhR5E
         WqwIV62uXEIGi2HYJuIOh3dX201NpQM3WCMcCDlcvuKa3pArwPGEbL40n6GdgpEd4GjZ
         BT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785123907; x=1785728707;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BdGAv8BxYXdTzf4sT+8+9cY8v4UQ6f5vnljwVuY+ezo=;
        b=qM3Nlq/XQdaLDyhPUKqOt97WwBcDGCDMAzqjjudbBmY0bQc9F5qWFOc8Cpb1w9uV0X
         f+nouBmfDvgAlE3KI4XXUS+/7aPjl1e7/fC6/3F7+naL97FeVrF17U3O2oF/WVLuZdSP
         pcfHNUjYMUL8fCjo/zl4A1Rbav4bbTrFrrMLLAdg1L4F31tPBWg73Xo9bunW+2gugftX
         APzIkosIs1CoL1ImPVS8qgEsuad0XbdOMSrc+lL/5ihK0SiUcGshwf1vPldBUk2gptLs
         mh69SCxx7+tUgTeT8IM/yjlNL2UmyHXFuDjV5X5rUwS+UiNb6/X04EvJEZlKJ3hM62dq
         24Vw==
X-Gm-Message-State: AOJu0Yx6/ZNLbcyLRThAdfyJMybjkVYWFLdWR22Vih9JIgtm8BKNglNs
	thmMQJkYhTEZFzDrLTjCR9q9FzblrykHbHge5hfHH9iJnxkv5vNTOmk84HA1o81NW2jjAbvecOG
	EPD34Jn/UH8qFmKxfE/OR7Hkp3YstARfm4jaqwL0=
X-Gm-Gg: AR+sD13Rh38oGzzVfewuKo+3hg5AMzL8vsFPYOGTGnNMls/Y+anAZGGv/jbUzZ+uLxP
	Nh2jb+Mf7e5Xk8w/P0pT3k4SdwIvgiX0pjtNYW+4x/M//y+TfrS+JkUxAcZB8PUfwzZbdqyxFEz
	EqgBXVehjLJSqGUk6SqkbVaouMEgdsGuLCwmT1m/fSYUXgkubCZRVu2gupIzKVrURme5hS9rakn
	3/EBnx3n45Wh8eqpkiWJPaDvi+Qv3PmXUPCo2FjTbhxE3UOrIhC60CkFNi+b9J398SZeAlpC9eB
	H3tS69eelNvq2kFsscI=
X-Received: by 2002:a05:6870:1792:b0:448:558c:d8bf with SMTP id
 586e51a60fabf-457f589df6emr5437964fac.17.1785123907360; Sun, 26 Jul 2026
 20:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
In-Reply-To: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 00:44:50 -0300
X-Gm-Features: AUfX_mxAp5xa27qUrgiG4Nsl4kdH9RkaFID5UM9p5dIRFUZApFRs82Ky5DyAtpw
Message-ID: <CAJq09z4TmoD2ZHsm7vENBqW8SCV9sGGCf4K1fE_xHz4FqHGGsQ@mail.gmail.com>
Subject: Re: [hwmon PATCH v3 0/6] hwmon: (adt7470): Multiple fixes
To: Guenter Roeck <linux@roeck-us.net>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	"Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

The b4 tool mixes the versions with the previous submission from which
these patches originated:
https://patch.msgid.link/20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com

Therefore, this is actually v1. Sorry for the noise.

Regards,

Luiz
