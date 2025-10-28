Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A78933FE16
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Oct 2025 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761664673; cv=none; b=KXXpCxGBl32DLcw5H1IprkiCXlFD0bGL7NSaXvmlVmXRoElOFLCrI73svxGgyBtvkkcroAQ91rW/RX3pb+R5LS11/4TPe8j2NaJGARemMHFpJN2zEihI89Nes7iQYbigMpzbc6I9OKlKSwpoiLXxCGqEVzj+EqvB7ffv+TFGQFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761664673; c=relaxed/simple;
	bh=MMaMHTb4Ah2CCrUzmnNSZ0wgi0JyjgLlM6vbEvp2sbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUilgGnKYmCr6O9qZOkjZftJDJ+Y5Fgms9+38RWjZxotMfgd295lhfktitTwHcRpR67bbYrgfkp1xAXWs4YSewi3Lhg/uZqAc98x/7l3ttJ5lqHSj9RPAH6Yn2ZatUby42bxz8N+HPM2IUQL0/6WAgXAngbYq1XdA5AJIZo5HhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=YCSOK9tt; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="YCSOK9tt"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso5948123a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Oct 2025 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761664671; x=1762269471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMaMHTb4Ah2CCrUzmnNSZ0wgi0JyjgLlM6vbEvp2sbk=;
        b=YCSOK9ttSSGanTt51EsKsqwqq8wteU+FncXeGl3p7zWom7oOtmLbMB4jwLwccPuYHU
         luuCrzTrwXIyaa+yC/oPFsoebtAWun3X9LuEWw1AXx5aBWH3sF6Xr8UDCYzK/r7T8HsC
         HyC2cCrsbGkvSeuekO6ztDd5klOuk/KQ8cwWR0rJlqEqBENaMguPCYqwRbPGtEnPP6lE
         FtqeFBvD4lBseIn7LhpOYgnO6H8zKgsn31u4QpgjoAqr7QgQr5SpfcUjo5/rhc01mdp6
         Xj1CIuTtWajxV1h8C0IXLdBicXs5jsEC6cVLhaMDrtoEnow9+ziEW8QFQxRYptx9gXTc
         mCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761664671; x=1762269471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMaMHTb4Ah2CCrUzmnNSZ0wgi0JyjgLlM6vbEvp2sbk=;
        b=izng5ynHcTJSTnaGErrAD+aza+QoXn6oFW+zHOPoJrjpU2DPdjirHs+8HL6f7AlfUt
         0I+3b/YUd7aAdGToXA2bQUZN6Wfb2W/z5wB9c1XRQ9H5R0y4+rLuHOgLx7FT2iA54K/4
         11MNkYptFK0qOMoAkCIjNO4WktszfOT1uxilge7uDA1RPZS6WoPAsj5I3U/i+f+NKdxT
         Oj8AbI4KGX0wXudoTpSSqYxSzLB5sQdC1TcJrwotzuNUdcIQI0dLAHqdq393TwVsW0pF
         ft1rqsv2IaPGMAbIQH61H2qv4byQzuvkIQdD7YNNqyrHLwx6onTJofnOjVMygkKu1wLo
         cSJw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Du6jD1etZIJc2zr6412bOQ6K62ncs6n8H5MHcKCiWAP+aeMM+cRsiyvAWj9PAH36MTqqF8AyoaeyYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7vpx9pPQk3TdQeq/Y61Y2g24P0gHAo4iUjCM255d5c30HTPEj
	LwQA/yogjkV29bqQSiOkIXeRpkfL64M/GUBYuh5zRKpObdJSVoe/hRqRTa8G0zZvlhI=
X-Gm-Gg: ASbGnctwrQWw7pZuzigW/U3PRESP7NXuIBS0I6f3C+FLXAXsTgxXfT/7TyZCvvsgGpK
	sUWBc2Tn3XT5jyUwroB3/sIjVZYYW6+x03qmLb6Yp7sjqztEM+yDJx3vCWKkcEX/o9ggwwRyVO+
	j6NJZbskepbosAqUJJdlkkSImp9FhSDCfrYwovkHejlXgAxvCJHykhl78zkqZMIHnbeEiXRiv5+
	MwN63xR2M4/LBxnVO+Mo6uiSReU8C8yGx0lGjLxBxNjz2HTvOUsxpxP3Cxl+Ls1kOJplHH7xt8g
	qmoHEe2HuYxuKCs04WrMFAYuiQE6xLPg0W2NnAUl1OcSS4N4l2zOgDZ81gVvJR6RJwlXAfVW3fK
	ehNTsmG7ifiZ35hk9Nej186ePUfldBUMy/PClgSA+mN09XWlCZInHLKPRmqxRk6tvHW+c5zxhzt
	WwY+wRUHi0RUWF7aOZ7w==
X-Google-Smtp-Source: AGHT+IH2TaPyS4w0bOjLoYbINLXI1oqC6DBGXJhehW0z/yn2CnV6ID73kQc6DVG+AgvO4fXzT9O+Eg==
X-Received: by 2002:a17:902:db11:b0:272:dee1:c133 with SMTP id d9443c01a7336-294cb39de3bmr44858755ad.22.1761664671204;
        Tue, 28 Oct 2025 08:17:51 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:647b:c9a6:1750:9275])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42afdsm118620375ad.99.2025.10.28.08.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:17:50 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: robh@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	skhan@linuxfoundation.org
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Tue, 28 Oct 2025 08:17:47 -0700
Message-ID: <20251028151747.663000-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027191425.GA1403533-robh@kernel.org>
References: <20251027191425.GA1403533-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Understood. The bit in question controls the alert pin polarity on the device side,
independent of whether the pin is used as interrupt or not. I'll drop the property
for now and revisit if there's a board that actually uses an inverter or needs to
program the bit explicitly.

Thanks, Igor
