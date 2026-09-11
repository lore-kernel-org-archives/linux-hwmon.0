Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F6C24293C
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 00:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789087828; cv=none; b=sH1hngEJgwxlm+FcEbuSs938dbZzUieAMg0L84lJf0ByRwOS5cOANvflkrsGN9pt7obPfUCQ3QhvvX/H8RmjjmIivCyJGwXNCdBlgApDLg22xsP9eoyYf5J8jaMZPvxCLOgueHAK9eFrabIhBTVLg5dFmkJWEIqITD2ywOKTouc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789087828; c=relaxed/simple;
	bh=k9CP8Uv0Cu5u05P+agi/B49fuH19D4pukpuoBfrG+Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/2/LkasIJFlNGs+MVnRp/Ku1E9259icg0irKJr14rrqAmitisb5eDixakkIaS+BDe0vgiZL6UtQ6jLa0UlrPDCYFw68XW48ptd0gcEGscUJX9LL6Tbaoq8W9K55mmBJRoBZRMVHEFpyC4fdrVRAABh0N26kuyMzUpQIlula0S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiPoQwQl; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiPoQwQl"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9865so2329845ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 17:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789087826; x=1789692626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E7Qs/YRK7iSN+nJFDW3LjPkoxVBPiWNImGpW7cLgflI=;
        b=hiPoQwQlyh2nUrzuMYs7uEcMegbxewr1F7yWWFwGUFa169RaDJvuwtSwxjiEt/xRnd
         R3D679OubVdHq0jlueVaAoX6diE9YN6t2xeS46H1K/rheVRSwsIp+xwtRjSUyRBDnC/p
         4c6wTaYBc2NmJvO5+xZLJj/o3L6JtJ1wYYA6v0Xkm5chaOW8pcS32eJ01RqDO+jvwCo9
         1a6ht4j3Z68+6mrs8EZ2TMxPPR4OlThezyJgLufmLVldWWU/BXrN9U7BENnT7znOPdgr
         VgZ9v0QpFELpDHKcIzuGb9KKR+4bVUfqpToRxHwtAp1i9LV/3JKxzAdV0LCkOCzgmHB/
         3TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087826; x=1789692626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7Qs/YRK7iSN+nJFDW3LjPkoxVBPiWNImGpW7cLgflI=;
        b=OpS646o85ffEvnCn4eU5RPEInFSpNlUTgQuQE798/0pqcJHUyF8cR2Bpru6l0l3h85
         rBEuGKv8JSdGgwlbOV7wumn5VskxssbXd711V4boLrjVgMiE1g0rI1ZeDW3y9GBcUnf6
         lDeF/1n1tkrztfIDaHpVGslG+Cz0F43Lo7jd1tumtqOwHemWFzYKAV/LqD/NZcSj64ur
         nFpO4jhrk2hsfMG5mvbmZedywJBgTGi7WlOqFTQUMqFUR4f5lsH0cuGyk3B1jq70QbVI
         r+uSte9eF5dYfhgX/Du3N57SlVuJ+hpGa2j8HJyzBiEX1ryHZ2OCH5Y9bpZNBocpDNrI
         O3OQ==
X-Gm-Message-State: AFuF++k5ineR2/2GRK2OEjfLKn4dtOUZ7qlFT5gODMzhXXHYq542Suq3
	POyu8yI7O8l2K8RUGA3pVy9sD0V6hYmEdPo1OL2NygiYuODYo7h7LgdSuyvqA/No
X-Gm-Gg: AYBFou2dV+OM6/rXnqVmqAeTBLyXNSWv+SrFEikR8Ol+CpZqntZXdobEpWmW3jo+yL2
	QkL34mK+iwEbBtF6Kn27xY27iCJwks7ya4ccqb1yRnxh+oxcEQWUT3QbWNm5wlPtqprC0KmAA0x
	/W7cohzTxw3kFuMBz4uOAdl7RtTThk3Z2VRA4dMrclHjOKm25dxHxvd/b3Ie+RZ85RdLeDDPOex
	ERpK1WrLLxR4T4rYxj9053wIu0SNXXB+bRQTwrn6pni8r9WVdM9X5Ym+6Bs+9HGHMzUZtaGZzL+
	mCF+h2pqaGB7Ku612Pe9uVE1qfcYv6gtmFI+3XzQe3PhZybXTlxr/05+dLGU9/OyvnflA1kkhDw
	5xDEJoyB/NZFK4FtzgHr6R3XaVQ5KH1a7bAWznrq+AiytQf7bhMAligSRSkJOCYGoWtoBjXzw7M
	8jqyHsMCbkiHs5lQ9t7UXJKwHMDUYe1uxU5pM+fT1bqq4tL+BU7jcluW4M+AMtG/9dGUVswr4MT
	U71ZknlOoJM
X-Received: by 2002:a17:902:cf4b:b0:2d6:fee6:65ae with SMTP id d9443c01a7336-2dd2a1c9c3bmr39121265ad.4.1789087826066;
        Thu, 10 Sep 2026 17:50:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ee07f2sm1454199eec.18.2026.09.10.17.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:50:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:50:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] Documentation: hwmon: (yogafan) Update model
 reference table and contributors
Message-ID: <fa4b19f5-730d-4069-a868-c1281d26895e@roeck-us.net>
References: <20260910184322.1816996-1-sergiomelas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910184322.1816996-1-sergiomelas@gmail.com>

On Thu, Sep 10, 2026 at 08:43:22PM +0200, Sergio Melas wrote:
> Add the new IdeaPad 3 15ALC6 Ub model and Yoga 740-15IML, update existing
> model entries, include corresponding contributors, and adjust the
> reStructuredText table layout and column separators to accommodate the
> longer strings and prevent Sphinx build warnings.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
