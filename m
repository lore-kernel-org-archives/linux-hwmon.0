Return-Path: <shilpa.bhat@linux.vnet.ibm.com>
Return-path: <shilpa.bhat@linux.vnet.ibm.com>
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: linux@roeck-us.net, clg@kaod.org, stewart@linux.vnet.ibm.com
Cc: jdelvare@suse.com, benh@kernel.crashing.org, paulus@samba.org,
        mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, svaidy@linux.vnet.ibm.com,
        ego@linux.vnet.ibm.com, linux-hwmon@vger.kernel.org,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH V2 0/2] hwmon: (ibmpowernv) Add support for current(A) sensors
Date: Tue, 20 Jun 2017 10:38:11 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-Id: <1497935293-31618-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

The first patch from Cedric in the patchset cleans up the driver to
provide a neater way to define new sensor types. The second patch adds
current sensor.

Cédric Le Goater (1):
  hwmon: (ibmpowernv) introduce a legacy_compatibles array

Shilpasri G Bhat (1):
  hwmon: (ibmpowernv) Add current(A) sensor

 drivers/hwmon/ibmpowernv.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
1.8.3.1
