Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E221D5B0
	for <linux-hwmon@vger.kernel.org>; Tue, 19 May 2026 00:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779150441; cv=none; b=oZ6kKWXTBFf56ATvFLcWaZWG8MGjQvOUaC8+5kct3Cdni+D0e5mulsUAVzRukKTf2A0i1HGPecRkEub5REuG4qMOKM+qvdMvfTMzbR5CCIhn90kTohoZCS2919Yd1RmDqiKqYFC+DPS2tw9s1GtLMWInQG4TQoa0sVlChs+5Myk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779150441; c=relaxed/simple;
	bh=5jBfMjx70K9+mHD2zp4KAHeW+IWt7gMJGSytd06NO9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4tuAUobdoBZfJ8BEj0J6uFesdq3HvALsTOVKJ4W2O7FzHbqhzcGvgXmvOEtziC596PEtExLmpu2GblI0x0X9Orus8UqikCj4vfYOKgxq7cnFnXoKf1c7FwG+SYn9XZ1gW0LM4PwOmLSldAPq57p1GhrcCJJ5rxpvZK9ks8wAtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhXWk2pC; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhXWk2pC"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-83d31ac4017so1280243b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 17:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779150439; x=1779755239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jBfMjx70K9+mHD2zp4KAHeW+IWt7gMJGSytd06NO9I=;
        b=NhXWk2pCzFN3E25BLG6IQREuZh1XsAhP/h/WykUGo/RIs2423MicHx1GO9B0IzLZv6
         ENoEZIMhk70tU/F0fnvQarSQkOaCVf1bNXBC1lW6vvGsUSq2OmjQ+2fWI4yZzB6LiYzt
         rdRhQi7GBDqTa7/eWj9zMt3W8kudczjtBWCb5eAyw5HEyUN7Zd9N8lqohxJ6D1LWPVJn
         4da9PYfgHr2SZEkBKoMZ+zACxuSJT2dfjBeBz0M9JskbfgwX+JEHew4a8cyLToLHFEeU
         qqNEodC4XcAB65vLCNIIYm8X4VOlXst0s369CyekvMyj+TtjEsDOML/aW4oQbn2ffcU9
         tfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779150439; x=1779755239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5jBfMjx70K9+mHD2zp4KAHeW+IWt7gMJGSytd06NO9I=;
        b=A7rIf916i/0XHZDeOv6ySNtxBxgv6mirQ5072eRUlkebN2ky2+MFKukhsncEFv9GyL
         hWwQDWgYL6gxsRtn3GDSWCBdOFUKxwWLIu3U5OxKWeEiGjnr3f24P2KA2pYYijpb6+5r
         /y8AOHaSUeLxcvOGfgPB+VqEOFFJAtWE5DylfBXf/PM+53JxY0Etd9y7x+BSai63NxZ2
         /Oo8RsRwVN6/Vy5hZZboa28Oh26m7jC/4F8m4tRvWWxhRGc9sftVolp7ffBNjirBwCpt
         NTtGNSOevlebNaH6NMKHr7U7y/Pr4nAWaabi2ggpK/jmr4UkT402Ud4jwygE6u5uXCI3
         KnDw==
X-Forwarded-Encrypted: i=1; AFNElJ+4sp7vtIXADS4WvfoxdKuFGZWER4XEYxYr1FSIhMzqFfZRdnXbjLjN6l2eK2kLKbTZFM+iBXHbh3cn5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDOTsOuWSc9LY+4W6y8Wb2PyiaonpZ4/IkeSeWDWt6VW05/+zG
	qNVNzmvbL1LwIvl++g9iiPmVjLPmvW71MG9pknKPvXbkEbn6zXoSQGlr
X-Gm-Gg: Acq92OErcj3kk1wmDqehZ24ooqKP+j3aXzvbxsLT6y9MPv4i7T8RR0wfMdDWO7vYafu
	LHjMxssNZ0FQsHvILZgacFJlYwN8HVfQLfn3oOB0UN7DBAXE4qCi3WaHgfuVNSyhYX/PCBmbmly
	5UpXnvVYYZQ1pfXtqBxT7xNlafWf7TTqI6sGgNc4HPDDX/fgXeG0QZDTJyfWre+x+WieWdkuTCS
	2OOwItf8b6/FwYWFbdI43HhtrHQO3QuVKYPxFF6eCFLY8pihdplpmCBhFHpdLnDP64aAJxLGDJV
	/DdPB9I6aaEtaBeKufsUHkVQGcA1ualLzzbpgskYNwRfkuBLUniLXCdRw6rNMc4iT3Klj5kz8P3
	MmeUUdn5BbN01ijR29L96xwFeqEO07dj6uPx1jAy6jL15Q7kmqFNpmaXN0UZtY5dv0pyRyY6wXu
	IifQbU7Eba3QiWFCS4LF5eM7Qpq4tX+6RYoo/e1XoWjvOEduaIQWcQl5/bKQ0/RsVRUHJlABYHD
	kRfMdUtBg2TAESAoPK0WRxJ2Vs4IFVoOGD/d+IV5M3rfS+EILaEBoUlLSpG5fo=
X-Received: by 2002:a05:6a00:3689:b0:82f:390a:69df with SMTP id d2e1a72fcca58-83f33df437bmr17739669b3a.35.1779150439256;
        Mon, 18 May 2026 17:27:19 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-130-21.dynamic-ip.hinet.net. [1.170.130.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f75c0d232sm4544463b3a.17.2026.05.18.17.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:27:18 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: hwmon: ad7314: document sysfs interface
Date: Tue, 19 May 2026 08:26:45 +0800
Message-ID: <20260519002703.544-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <006d3f24-b1cd-4fad-b8b6-96ddd904c283@roeck-us.net>
References: <006d3f24-b1cd-4fad-b8b6-96ddd904c283@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter,

Understood. Thank you for the feedback.

I will avoid sending this kind of low-value documentation patch in the future and will be more careful in judging whether a change is worth reviewers' time.

Thanks,
Chen-Shi-Hong
