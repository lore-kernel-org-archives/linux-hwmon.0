Received: from exactco.de (exactco.de [176.9.10.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F9D25CC74
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 18:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.10.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405442; cv=none; b=OSqoeeb5yQgn+1/QJpajEohSkXT2H3Smz5VRHEVu8TYkHqnLVAN/I/azfjzLfnbDYdd7Zwq8nMGJpaEeGMr/TLJgMkl+77Pb/V63AoROoh3I6P2EFdQ058e/ciV5lGGyIwgFU9BiwBoWlTQMWQtX1Gy+BXL63b0wLuMDo9+1aCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405442; c=relaxed/simple;
	bh=06vof6vHg72BSNVnRJ1E8iaG0YCBtoatgT6/Df8mc3s=;
	h=Date:Message-Id:To:Cc:Subject:From:Mime-Version:Content-Type; b=ixYY7ltKFBQnDfg5n4UK4/RW7RPqzERTRlk1ouGjuhNLlO4moluwTKsm7TmbK5UguaqiXTvwiw9iYFOa74aGLPkKHY+VH7lD8lDpMdTRuuWNFexu/MCGjUseQYaS2L9Vxxu77oXV42njKolPaA0VNBWOzRXq7ZX0RGrC+NWWVfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de; spf=pass smtp.mailfrom=exactco.de; dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b=OS1xbvc/; arc=none smtp.client-ip=176.9.10.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exactco.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exactco.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exactco.de header.i=@exactco.de header.b="OS1xbvc/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de;
	s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
	:Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=qAt6AO/oZyqHQ1aXJaySQBan6c/hfB99OizkfxTzhCU=; b=O
	S1xbvc/BafsjI7BN7rJw5U0kiGdt46cDo+qzqbrB/FKoeTlEdfiYsPLTZB6wYVQZco/mxY+b2idRD
	VpER0fyk0EMRnbOivYn5XX5/hJ8HHhLJD27hfpyoJDt8NCKipNhORTONXvZqNnqcwC/uDBtRu2uJn
	7RJYaFywCjthwY5O1GU7dMafqxztRyel1RTWwD3vIdy5GkVSulFuZsDCrde/B8MOz+Jps21ktpuj9
	2Vu94S1rEXv8p1U2aDeIPY13aA51ecY1CGYqORonybdYvqqxmA+NNUXhqo51JKiDNck3sdSSewy5A
	zwuGvtUUrgg0EJ2SDij8wByXiULcWCFXA==;
Date: Mon, 17 Nov 2025 19:50:48 +0100 (CET)
Message-Id: <20251117.195048.691713748773231900.rene@exactco.de>
To: linux-hwmon@vger.kernel.org
Cc: Clemens Ladisch <clemens@ladisch.de>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH V2] hwmon: (k10temp) Add AMD Steam Deck APU ID
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

Add AMD Custom APU 0405 PCI ID as used in the Valve Steam Deck to
k10temp.

Signed-off-by: René Rebe <rene@exactco.de>

---
v2: define SOC PCI id locally

Tested for nearly three years on my first gen Steam Deck.

index b98d5ec72c4f..7062d12ff6b6 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -84,6 +84,12 @@ static DEFINE_MUTEX(nb_smu_ind_mutex);
  */
 #define AMD_I3255_STR				"3255"

+/*
+ * PCI Device IDs for AMD's Family 17h-based SOCs.
+ * Defining locally as IDs are not shared.
+ */
+#define PCI_DEVICE_ID_AMD_17H_M90H_DF_F3	0x1663
+
 /*
  * PCI Device IDs for AMD's Family 1Ah-based SOCs.
  * Defining locally as IDs are not shared.
@@ -553,6 +559,7 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M40H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M60H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M70H_DF_F3) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_M90H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_17H_MA0H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_19H_M10H_DF_F3) },

-- 
  René Rebe, ExactCODE GmbH, Berlin, Germany
  https://exactco.de | https://t2linux.com | https://rene.rebe.de
