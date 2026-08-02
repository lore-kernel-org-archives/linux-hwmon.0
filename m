Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51961F8691;
	Sun,  2 Aug 2026 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785688367; cv=pass; b=sO7Vt0gwLo6yD7NyJtTc+WpOsFTxt26Mp9L+fR3DRLllkaUa2ENP4UqjVugmagC3Lm8WqTTYfp7Lt/MnUJ3YfUeUA5UNs+rQTWC06IIkAuXp/we39jQztrP3KLoYgG8R5AKL/uogusAbZ5xjolS3iS4GHnf5Rogy0a+C3/T/pqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785688367; c=relaxed/simple;
	bh=MMOvNbcfGXQpX7kLzeRBXSnu5wfzWEj3K8W0ihQ6hkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVSgeYhhPf+xQ/zvQvxqkrTZrpiwnm5ae3LpSKXsi7X1RUKH1U/GgPaUnZUAo8SPy0u2MSJFXsHL4xnt8Il33nmVKjBi4nG1++lDF+C3VofbXm8iHn49Btn5UjlCid7B5qK9/+XqP3YGnjZRU42e6wbQos6awz4NzC+6Spptv4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=e1DQ9Ksy; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="e1DQ9Ksy"
ARC-Seal: i=1; a=rsa-sha256; t=1785688339; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=YGCOqcymhI0/NO9VPK5JoG5FBK5xfLw56kYxtkOqyoC+T5BggYu98Bm8qdXAoMuNXe6vCuVCGWrjXLJnbC16onUM9mY9eMlvfVeKTxly2GcHaoHFqDcfjvBQ4iLRZ9giROcQa72N70M4hVZLifyN/BeaIVqka7I9JAG8mYzVBbQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785688339; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MMOvNbcfGXQpX7kLzeRBXSnu5wfzWEj3K8W0ihQ6hkc=; 
	b=LWhp7rtn02n15E7ooFlNXQXUr4tl3kQ4mf0w4cBZN+beOBFFLc7FaPcFWod4ZOuzNqzTWbZyLaRuV9uxUfqzR9MtISVUG6UufP/PDi0skcBSHIEsgf7K9XwShKj60vDg6RZbLuzwwu/3MahTdM87y/ZZPFZYzauVHi46AilYB08=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785688339;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MMOvNbcfGXQpX7kLzeRBXSnu5wfzWEj3K8W0ihQ6hkc=;
	b=e1DQ9KsyP0RiXbmWRd0lzR6VbHGp7e6zE1pSN+YiyLGag6DSQ4b4aisqMw5bEz9S
	EabDTNyLPXc87k9oZYVZLQpkKTD8c5YttkRtm5lMge/Qt6Ir+0jOFOYuDEKDJtSOPGf
	/uAj08EcrQYDYO5JjjwdFYoZwQqFFV6m0pldWn/4=
Received: by mx.zoho.eu with SMTPS id 178568833763697.70373757532741;
	Sun, 2 Aug 2026 18:32:17 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) null terminate the vendor and product strings
Date: Sun,  2 Aug 2026 16:32:07 +0000
Message-ID: <20260802163207.51184-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6a0cc456-3ee2-4039-b8fa-e159d6d99889@roeck-us.net>
References: <20260802125327.21469-1-ali@iusegentoo.com> <20260802134244.29107-1-ali@iusegentoo.com> <6a0cc456-3ee2-4039-b8fa-e159d6d99889@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Understood. Dropping it, there will be no v2.

I should have said that in my previous mail instead of offering options
after agreeing there was no bug to fix.

--
Ali
