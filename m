Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ffVjKnD5"
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 380561702;
	Wed, 15 Nov 2023 18:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=+zZni
	+Wt/R2Y7uD/CYRx8roVH5dVaca0SpCjlwx5APU=; b=ffVjKnD5Qx753VJ+70jVq
	1SxtJipouf9lGbK9WfXHNDzj2wJh0g8r4BgUssQo7UNtE5CA8qj+VLlHpvD6tLMz
	L4H6K3Qy+BcqTNubNJhRpX76ed1S1bum9iBKxSdBK6jmXMEQ+Ntqf7xCB9HvA7aE
	ii8XyQk/HnUXqPYWJ5a5Gc=
Received: from localhost.localdomain (unknown [39.144.137.125])
	by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wD3H2U+fVVl5bnXDA--.19779S2;
	Thu, 16 Nov 2023 10:23:59 +0800 (CST)
From: Xing Tong Wu <xingtong_wu@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: xingtong.wu@siemens.com,
	tobias.schaffner@siemens.com,
	gerd.haeussler.ext@siemens.com
Subject: [PATCH 0/3] *** hwmon: (nct6775) Fix pwm bugs for NCT chips ***
Date: Thu, 16 Nov 2023 10:23:27 +0800
Message-Id: <20231116022330.2696-1-xingtong_wu@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H2U+fVVl5bnXDA--.19779S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVsXoUUUUU
X-Originating-IP: [39.144.137.125]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/xtbBnAQq0FghlXvj-gABsp

From: Xing Tong Wu <xingtong.wu@siemens.com>

These patches address bugs in the pwm features that do not meet the
specification definition.

Xing Tong Wu (3):
  hwmon: (nct6775) Fix incomplete register array
  hwmon: (nct6775) Fix logic error for PWM enable
  hwmon: (nct6775) Fix fan speed set failure in automatic mode

 drivers/hwmon/nct6775-core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
2.25.1

