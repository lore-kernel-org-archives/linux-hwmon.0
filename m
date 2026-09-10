Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AB5582B81;
	Thu, 10 Sep 2026 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065600; cv=pass; b=ROutAHiJxvlLl5kI+JoMZih95l5PU25p9uEebOqY8RFLss5Uz8rG5ECDdHY+ZASe5ZGxPu7toyoiZLQccT+6HLV6R3RMGtU+dJYvDSFuK6uZC/k1Puj1DSw9U3eDV6vjcdt1hJ0CjY0sPg4ONnhmzuXTGZVFkCt1/CcxFf4Zw5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065600; c=relaxed/simple;
	bh=pKmUBZjvCvWnTY4B3AY8+HbAzLyqcIXCSFnLdyFDDJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mSzXXg4JkW043hG99CYR6vqNkgH2Q1YdUgGrsLMpsS0XYnBz7caekMZ4IrZTfcVUEEvGPL9dPaV++OnwNqXtu4GDhsgfDCvbY8qn+/IwVTbWoh3Hv+E9Q4aEZ+ofNmB5N8U440pw0UMz9dHWt6D8/yePZIMPTFf/mW/SF1Sts1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=G23wTz52; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="G23wTz52"
ARC-Seal: i=1; a=rsa-sha256; t=1789065572; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aEspYeIAVX5LRhYGpcatPFtUwCsskNcfs99heYNH1dcJg82LySUra9B3d4sMCJDeR1nQDmhxBW9sYSZVQSOFNqgfeGM8OaaEd2AwaTONIJ0M790E6x0fwY1/MjtQpF1WjNyW7GyMHTHuGTR4s4HPMjrhyk4JQjVoySu65gGCTpA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789065572; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UzY9IqqH8d74c1+yMT1CaeM0qgoMHbI69qgXStGRByg=; 
	b=WeqrVR3F0ASL4PtnIFvbsXD09dfBELwZSrq1AHnTyK+/vWNzVLBvzELwMicV5ZwifrRWFmXFFikt3KGkxZaE5Qt6O6yZfgtc/zk+CrMIqxPit3iV1twlo7j0yDbfmumv5RmipwlvxrJ3QB7fK8ar3GQJkV8eXb00pSji/wUXLck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789065572;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=UzY9IqqH8d74c1+yMT1CaeM0qgoMHbI69qgXStGRByg=;
	b=G23wTz528vy+KmNHhxuuFVy9OcOWOx7PrEYqt1lU+5ebQ6ml4CSvAj6Sol1fs1zb
	h5xCZgNLGpwPtUEYEbd3hIhMxy1ikZqk4m270ZMaALelBxQIr+Rqrt/JYNBNAfTCOQ+
	FrpA/5DA3eRljiPViKNg6qQnqpHCcpNKSYY0QhCBx1SDkBaPojv4TKa1mwgA+urEefc
	mfMVWF5yRA3BktJ9Ceolsf6hD5zCx3PMOhfQ64BlvSkPKVA8fh7XiiH6DLuF00Et2wQ
	cfYrxE7Fjnpp1gx5XXBFBYK+wLvMHixQk2jd8NCTyRXFlZUYNRRQlxvjNtO47B9wvik
	zqj8hcnx4Q==
Received: by smtp.zohomail.com with SMTPS id 1789065571642823.674294366569;
	Thu, 10 Sep 2026 11:39:31 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 11 Sep 2026 02:39:25 +0800
Subject: [PATCH] hwmon: (k10temp) Fix model id range of Zen5 Turin
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-k10temp-fix-zen5-epyc-v1-1-643f5a248ae1@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw7CIBSE4VdpztqTSIB4eRXTBeCoRyMSoMa26
 buLdfklM/9MBVlQ6NjNlPGWIq/YoDYdhZuLV7Ccm2nnrbLOeH6obcUz8UU+PCFaRhoDK6O1wd4
 67Q/UvimjDdbuqf+7DP6OUH8xWpYvaUo0lXkAAAA=
X-Change-ID: 7b515a4b-k10temp-fix-zen5-epyc-14334e85a3b9
To: Clemens Ladisch <clemens@ladisch.de>, 
 Guenter Roeck <linux@roeck-us.net>, Gabriel Ford <gabriel@gford.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

Model 20h-2Fh are mobile processors with single CCD. For example, model
24h is Strix Point, i.e., Ryzen AI 7 (PRO) (H/HX) 360/365/370.

Including mobile processors in the model id range of Zen5 Turin
processors leads to bogus reporting:

  k10temp-pci-00c3
  Adapter: PCI adapter
  Tctl:         +54.1°C
  Tccd4:       +148.6°C
  Tccd6:       +148.4°C
  Tccd7:       +149.1°C
  Tccd8:       +149.2°C
  Tccd9:       +149.2°C
  Tccd12:      +149.1°C
  Tccd14:       +22.0°C
  Tccd15:       +22.0°C
  Tccd16:       +22.0°C

Fix it by removing the said range.

Fixes: 8440d5aca227 ("hwmon: (k10temp) Add per-CCD temperature monitoring for Zen5 Turin")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/hwmon/k10temp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 75a45010d687..3e7e63edc6a3 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -523,7 +523,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		}
 	} else if (boot_cpu_data.x86 == 0x1a) {
 		switch (boot_cpu_data.x86_model) {
-		case 0x00 ... 0x2f:	/* Zen5 Turin */
+		case 0x00 ... 0x1f:	/* Zen5 Turin */
 			data->ccd_offset = 0x1F0;
 			k10temp_get_ccd_support(data, 16);
 			break;

---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 7b515a4b-k10temp-fix-zen5-epyc-14334e85a3b9

Thanks,
Rong

