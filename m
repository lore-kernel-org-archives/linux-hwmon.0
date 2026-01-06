Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA94C92;
	Tue,  6 Jan 2026 15:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714891; cv=pass; b=tHAfvQGDc4bPcfPdkG1NyOIHiSQjLoHh1VfiVksxI+EcNUJLMvnA8c8y6hAS/aSVL46erMo+Kq+yLDQyVhlWI6vRAaI7RNzI791dl9zBjWQhDWJX0uappRbT1sSEJM8QAJSKbv0WYaK0SMbPaREmaE9xWfxJu1m1Hji295MsbA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714891; c=relaxed/simple;
	bh=pXjXXx8Kmd8MklVOzPzaeLs1HKVm5pQulrpWsS/gs98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qFOpw1aguVd8pvAf7Xp4aTEUM1dMMKgC8nON1zWd3Ev2iRABO/V0TJh7sReV9sn+bOIX0yFbObgsHA6teJGEJX/8C3DihrjzDj5wranD9bJvA7jifgtW4Rq9b05TIM7dCHZBItt/wtnYy2nC/jXRsEQtF1VA1x1pbXFG1IAXW+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com; spf=pass smtp.mailfrom=laveeshbansal.com; dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b=fOg+O3SB; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laveeshbansal.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=laveeshbansal.com header.i=laveeshb@laveeshbansal.com header.b="fOg+O3SB"
ARC-Seal: i=1; a=rsa-sha256; t=1767714869; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CPzlp1inx76qOOS++8TDqozZacX8yTU2DMsEYQayOFSegK9hfVhmczYkzwwEkz5Q2VlkrmNhyXzoHXVp9UyOPkt0iGswZ+XQIhpimuA++ft5hsUpipms0DhcNGZt9s9ywK7bx327C7OVkJEwem3QZoUMkMFNMlGzKth+gtR6+4c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767714869; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X5wAPEYnQbRCP2SlfvKn4TQ60T+KpdRGOiain+F3BcA=; 
	b=CsnCNhOspZ5IO1x4KvJj0mQ2ImbbdAN0OhMGSw5buAnDLZIecZgCxS7E8e16y+d6BButBeEbecWqFRxZ1DvOOostpeRzcxdOZKkgQUukGZ2QdboujxfM7UEl6UvqpkfyG5aPSawHpWXTqoM0/gS4Tz6/2APq1490e5Qp/bVMITc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=laveeshbansal.com;
	spf=pass  smtp.mailfrom=laveeshb@laveeshbansal.com;
	dmarc=pass header.from=<laveeshb@laveeshbansal.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767714869;
	s=zoho; d=laveeshbansal.com; i=laveeshb@laveeshbansal.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=X5wAPEYnQbRCP2SlfvKn4TQ60T+KpdRGOiain+F3BcA=;
	b=fOg+O3SBfHtQtWipyX4ZuaJG6PcndDkyL9o0wOLEYPS0Rk/LEIsvbV/bUZb1uxDJ
	GQ0TrVuIRnvenYhI7E9/B7ZbZQB0YFY5Xp4vUEBdpR/Een3dnuKIiiCG6m0CJQKd9OZ
	0dk9FGwcpsHDAbvE+SPvdtqyJThhqSZ2P1t5MZ04=
Received: by mx.zohomail.com with SMTPS id 1767714866498738.8816595812685;
	Tue, 6 Jan 2026 07:54:26 -0800 (PST)
From: Laveesh Bansal <laveeshb@laveeshbansal.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laveesh Bansal <laveeshb@laveeshbansal.com>
Subject: [PATCH 0/2] hwmon: (coretemp) Documentation and TjMax table updates
Date: Tue,  6 Jan 2026 15:54:24 +0000
Message-ID: <20260106155426.547872-1-laveeshb@laveeshbansal.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series updates the coretemp driver documentation and adds TjMax
fallback values for Intel Atom processors from Silvermont through
Tremont microarchitectures.

Note: These TjMax values are derived from Intel ARK and official
datasheets. The table entries serve as fallbacks when
MSR_IA32_TEMPERATURE_TARGET reads fail (e.g., in some virtualization
scenarios or locked BIOS configurations). This follows the existing
pattern for older Atoms (Bonnell, Saltwell) which also have fallback
entries despite supporting the MSR. I don't have physical access to
all processors listed — testing feedback welcome.

Patch 1 - Documentation update:
- Extend supported CPU model list with newer Atom processors
- Clarify that X86_FEATURE_DTHERM is the actual detection mechanism
- Update per-package temperature description for Sandy Bridge and newer
- Document that TjMax is read from MSR_IA32_TEMPERATURE_TARGET
- Add TjMax values for 22nm, 14nm, and 10nm Atoms to Appendix A

Patch 2 - Code change:
- Add TjMax fallback entries to tjmax_model_table[] for:
  - INTEL_ATOM_SILVERMONT (0x37): stepping 9 = 110C, other = 90C
  - INTEL_ATOM_SILVERMONT_MID (0x4a, Merrifield): 90C
  - INTEL_ATOM_SILVERMONT_MID2 (0x5a, Moorefield): 90C
  - INTEL_ATOM_AIRMONT (0x4c, Cherry Trail): 90C
  - INTEL_ATOM_GOLDMONT (0x5c, Apollo Lake): 105C
  - INTEL_ATOM_GOLDMONT_PLUS (0x7a, Gemini Lake): 105C
  - INTEL_ATOM_TREMONT (0x96, Elkhart Lake): 105C
  - INTEL_ATOM_TREMONT_L (0x9c, Jasper Lake): 105C

TjMax sources (Intel ARK and datasheets):
- Bay Trail E38xx (110C): https://ark.intel.com/content/www/us/en/ark/products/78475/intel-atom-processor-e3845.html
- Bay Trail Z37xx (90C): https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z36xxx-z37xxx-datasheet-vol-1.pdf
- Cherry Trail (90C): https://ark.intel.com/content/www/us/en/ark/products/93361/intel-atom-x5-z8550-processor.html
- Apollo Lake (105C): https://ark.intel.com/content/www/us/en/ark/products/95598/intel-celeron-processor-j3455.html
- Gemini Lake (105C): https://ark.intel.com/content/www/us/en/ark/products/128989/intel-celeron-processor-j4105.html
- Elkhart Lake (105C): https://www.intel.com/content/www/us/en/products/sku/207907/intel-atom-x6425e-processor-1-5m-cache-up-to-3-00-ghz/specifications.html
- Jasper Lake (105C): https://www.intel.com/content/www/us/en/products/sku/212330/intel-celeron-processor-n5100-4m-cache-up-to-2-80-ghz/specifications.html
- Bay Trail stepping: https://community.intel.com/cipcp26785/attachments/cipcp26785/embedded-atom-processors/4708/1/600834-329901-intel-atom-processor-e3800-product-family-su-rev015.pdf

Laveesh Bansal (2):
  Documentation: hwmon: coretemp: Update supported CPUs and TjMax values
  hwmon: (coretemp) Add TjMax for Silvermont through Tremont Atoms

 Documentation/hwmon/coretemp.rst | 56 ++++++++++++++++++++++++++------
 drivers/hwmon/coretemp.c         |  9 +++++
 2 files changed, 55 insertions(+), 10 deletions(-)

--
2.43.0

