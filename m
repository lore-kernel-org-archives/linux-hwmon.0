Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DE97E9
	for <linux-hwmon@vger.kernel.org>; Sat, 10 Aug 2024 00:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723250086; cv=none; b=cIv6fPPp0OkGbxk6ktbWb8nX3/t6dFjEu9l+VaUAutYocrVYT8/DRpDj6HhbDYONunVayF7Bz7Cohkqtg+vOhtyeN3YnAmpyk/2i02bPxJROeYgDMPrQltfMA21HXKtzjNj0oyvHnn/9Ls9n2zPqRE4lEC30Ly1ndKwWstZaKyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723250086; c=relaxed/simple;
	bh=oSHrVPTVyklLnpD7FP4CqUxmFTVvNZMZ/lHd7SK2dfo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=L9PEy0kQcU9IJE9sNLf+V9SKiJet0eiWsgaB1AmJeTS8BAjb8ddS1nomIVnwSUZ2mwpFtFZmyle2+9cyBA6KzaWr2Bo3LCEudToXkxKqBB12iQohG2iSK69YDz/eKbVR6A7FdFDtGrSqUM+peMxMMX9lV0iKBlJ7rN/8OuHL59M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=OB+JvSWk; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="OB+JvSWk"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6b7a3b75133so17120806d6.2
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Aug 2024 17:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1723250084; x=1723854884; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSHrVPTVyklLnpD7FP4CqUxmFTVvNZMZ/lHd7SK2dfo=;
        b=OB+JvSWkbGl+7y+bxnsBCntJJ9Wbjvp9rYcVjn5VetFDv/2sUrtT7fEqVlc1F6QyqF
         PM4d5Ggy+h4iPRJld6IVMw0psZfiNmMHZyfTbiOSHif32pIBuoqgRj108jgzI9frXWM/
         kg7JgQ4uRMwjQ5g1tTVS1SwBKzIMn+44DUkNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723250084; x=1723854884;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSHrVPTVyklLnpD7FP4CqUxmFTVvNZMZ/lHd7SK2dfo=;
        b=XEcIyMQ7i8y9Uqa+i/hQ4DJr0Fzb1IP4/80B8sfCu7bJieGucMGQDqUv+G+6bN/PFl
         PP6L+HD+rDjxCAQRNgVbQGjFmtzb0WBirNZsePcjksOLAovINfXnAeDy3+H4sb/frARJ
         iGgkGGAq5y1WG6Nx4+XMrFUsjq5ti9cFA9RwrZejw6RcFW8BE4k9IBkrY4YVTw0DuoSF
         X3LzD8qSxqSb9obI20TZv7sDsWRxoM20dz99rMBNQStf6PXqb4WaYk38yYyMGEvo1Fd1
         6Qj5M+CmD8+ElFi1OTzXsHcacUVkqo0zIbTZdvZvK35uKGX7HiPHvQ+nh/Q7KAk4USQY
         zPVw==
X-Forwarded-Encrypted: i=1; AJvYcCVpvmSRAvrTPYGyqzfUunTRjZQLH/cn/MRBjg7MczqN6CRNv22XfeKnLbR/cVvhfyBsZ/i6lZbZvk9myiqq2RtSZr6fhOeAItsbUJk=
X-Gm-Message-State: AOJu0YxNHJITRFxU5rONBRf24cnhTA4sqLzIhTffSm6qz0Wv4RdEAWow
	ahjV48Kgi28fZae/JfjA13nxDENjfNbGuwSuYYmMO1e0KH1ySfu8E54G92fXC7w=
X-Google-Smtp-Source: AGHT+IGLYIiSBYXL7L13kFVDwOYWS4+0ru5AwylZmzY3NHi4+KAgDtksYaNenf3nZLTIuGRZOXWeqA==
X-Received: by 2002:a05:6214:440d:b0:6b7:a3f1:3251 with SMTP id 6a1803df08f44-6bd78f079e2mr35735196d6.51.1723250083657;
        Fri, 09 Aug 2024 17:34:43 -0700 (PDT)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bd82e54586sm2703456d6.109.2024.08.09.17.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 17:34:42 -0700 (PDT)
From: Ivor Wanders <ivor@iwanders.net>
To: konradybcio@kernel.org
Cc: hdegoede@redhat.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luzmaximilian@gmail.com
Subject: Re: [PATCH v2] hwmon: Add thermal sensor driver for Surface Aggregator Module
Date: Fri,  9 Aug 2024 20:34:35 -0400
Message-Id: <20240810003435.10539-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <6027d9db-b1a8-4eb0-a0b7-451f1524834c@kernel.org>
References: <6027d9db-b1a8-4eb0-a0b7-451f1524834c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Gave it a shot on SL7, some names are repeated and one sensor is totally busted

Interesting, thanks for testing. I'm not sure if this is the right place for discussing this, or
whether we should take this to the downstream thread (link in cover letter or in [2]).

I have duplicates for RTS{1..3} as well, so you're not alone there, for me it's also sensor 1 and 9
forming a duplicated name pair [1], this makes me wonder if the names are always of the form
`I_RTS#` where # is (id % 8 + 1), if that is the case for all surface models the names may not be
that much of a value add?

The surface diagnostics tool actually doesn't request these names: it has hardcoded names for just
three sensor ids that are part of the diagnostics [2], but I don't know if those three id's are
stable across the various devices though.

~Ivor

[1]: https://github.com/linux-surface/surface-aggregator-module/pull/68#issue-2054614428
[2]: https://github.com/linux-surface/surface-aggregator-module/issues/59#issuecomment-1974827016
