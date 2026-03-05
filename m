Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FFB3A7F52;
	Thu,  5 Mar 2026 14:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721663; cv=none; b=bAq1mhaNURACTR2Q+x+jHE0d5GcPFoTagD2UtIxdAyatYiJGvNcKKRU3K54pokYstRyt9aVZBWsfOurp7NoKrk7/BnyEAroUAMbGFuSbp1retlse6cfrpw8669vm45WFA8b1k6AUJcUX28de0p0nhPVf9glaBsLEqwfW29ZCugw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721663; c=relaxed/simple;
	bh=9hNhGk6ESE0+JQXICov6JUntd6Ry+EwVQFUHnFqENrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JzRt8/UK/OAcX7RuBpoFpDhbAJY8GqaamyGt4NaGGS/JzaMZIbnw2xT0mIP4H1HoRlHYjIdzpjZ2ge99/h3WKC4hUThZG1p2Ml9IRnkJX5nJc6uiwiVoZWvZdkPfC+o0MW5zVFs2koZgJcvRzGAH82yxSwTUErrnU4T6JsCgAqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
	by APP-03 (Coremail) with SMTP id rQCowABnhNvulalpTx7iCQ--.24548S2;
	Thu, 05 Mar 2026 22:40:47 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v2 0/2] Add cofficients to the TH1520 PVT
Date: Thu,  5 Mar 2026 22:40:42 +0800
Message-ID: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABnhNvulalpTx7iCQ--.24548S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrWxZF1DWw1xKF1xJFWUJwb_yoWxCFcEka
	409FWDCws5A3Z3tF10yrWxJrs8A3y5C3WfAa48tFy2gr98Cr98ZayDCwn3Cr4UuFy5CFyx
	Ar1kGrZ7t3y2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

This patchset tries to add PVT cofficients from the T-Head TH1520 user
manual to the corresponding DTSI file.

The v1 revision of this patchset is called "Initial thermal management
for Lichee Pi 4A board", however the thermal zone and cooling related
parts are already added to the DT as part of the TH1520 PWM patchset.

Icenowy Zheng (2):
  dt-bindings: hwmon: moortec,mr75203: adapt multipleOf for T-Head
    TH1520
  riscv: dts: thead: th1520: add coefficients to the PVT node

 Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
 arch/riscv/boot/dts/thead/th1520.dtsi                        | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.52.0

