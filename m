Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05C23C1D4D;
	Thu, 10 Sep 2026 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028889; cv=none; b=PmShH++xzgglcgCB+QzzZYYB+ZFaf2X93bn9uZ1OKNsp55BwIhSP+QbZZnSfpU4CoKLH/UnNf9wVKQxqgGscdFFOmXDAS2aGNiQxYwH0KUAUrmdEe9taIU3Ost94ewyPsokMUT+D6/4/6q1r3a3NrB7tK0mPXnaHQW96a1YF2Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028889; c=relaxed/simple;
	bh=A6bfEiQ3XiiCRi84y5G2QqeLzm5HSvheRMeEPmAIJXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtKKzh6UlOGvcdU9LG71iMe01u8OMvunujo0FGq3oD6Y3WyOImPV9UtP9Fe7zzgUeUFhyYmmAwav9oV24tfEJg5OyFDXxKlOiccOzBfC8kbrV763VxsiLTLSvLxnuXo99BMGRDju1smsLnlEy3x5V9B9YsGPS8TK18xPYCxWdXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07791796|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0232513-0.0013683-0.97538;FP=12198027199983978135|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAJ3593_1789028871;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAJ3593_1789028871 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 16:27:51 +0800
From: Lin Wang <wanglin@open-hieco.net>
To: Borislav Petkov <bp@alien8.de>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Pu Wen <puwen@hygon.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Guenter Roeck <linux@roeck-us.net>,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] hwmon: (k10temp) Stop matching Hygon devices
Date: Thu, 10 Sep 2026 16:27:31 +0800
Message-ID: <20260910082734.3771675-6-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910082734.3771675-1-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

k10temp matches the Hygon F3 device and uses the AMD SMN accessors.
These accessors derive an SMN node number by subtracting PCI slot 0x18
from the F3 slot, then pass the result to amd_smn_read(). Hygon PCI
slots do not encode DF node identity, and their SMN roots are grouped
by socket.

The derived node number therefore has no defined relationship to the
Hygon DF node or its SMN root.

Remove the Hygon PCI match and Family 0x18 branch. Hygon temperature
monitoring requires the Hygon node and SMN interfaces and will be added
separately.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 drivers/hwmon/k10temp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index 75a45010d687..20a5470e6593 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -475,7 +475,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		data->read_tempreg = read_tempreg_pci;
 	}
 
-	if (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) {
+	if (boot_cpu_data.x86 == 0x17) {
 		switch (boot_cpu_data.x86_model) {
 		case 0x1:	/* Zen */
 		case 0x8:	/* Zen+ */
@@ -583,7 +583,6 @@ static const struct pci_device_id k10temp_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M60H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M70H_DF_F3) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_1AH_M90H_DF_F3) },
-	{ PCI_VDEVICE(HYGON, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{}
 };
 MODULE_DEVICE_TABLE(pci, k10temp_id_table);
-- 
2.43.0

