Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921BF3C278A;
	Mon,  9 Mar 2026 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073516; cv=none; b=lyU/bEyxuNxJ7QOn53rhUag6/von0RrHbqMEmbWwPdH1XjauGVd6eKjVf9zYkNd+fAzWZa49Kx/plZUY7dTyLbgwI3cnGdSSqDZGZnyD5w5Gv6y3CFumLSfC/hD9RsV9vq3XX8N7DFmLkFpowsWsCJzs6PMNVsD6x6xem5EL/XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073516; c=relaxed/simple;
	bh=m0HoBJhXlOWspdIBJwCGhKY5/upyORpEWEjdoG3tBYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tnrlFklvXdj6HbXGlWj7hGiisDU6OuupenLS7skqHElbMKKuu2+fmyqLMB956Tsi+8hXg9oJ9K7l8JtPWIxkNaWCnxzjxlL9pimdNDhmJ/v5lVZE+fBTEeHD3tvjiquaZmzSxPJPUFyMi3viZjRpyKET8u+CcmJ521rI2VdI4eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
	by APP-05 (Coremail) with SMTP id zQCowABH1Qhb9K5pgkP5CQ--.22703S2;
	Tue, 10 Mar 2026 00:25:00 +0800 (CST)
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
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 0/2] Add cofficients to the TH1520 PVT
Date: Tue, 10 Mar 2026 00:24:55 +0800
Message-ID: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABH1Qhb9K5pgkP5CQ--.22703S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xrykur4rWF4rWrWkKw1DAwb_yoWxCFgEka
	409FWDCws5Aas3tF10yr4xJrs8ArW5C3WfAa48tFy2gry5C3s8ZayDCwn3Cr4UuF98CFyx
	Ar1kGrZ7t3y2gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

This patchset tries to add PVT coefficients from the T-Head TH1520 user
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

