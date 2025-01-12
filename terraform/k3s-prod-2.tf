resource "proxmox_vm_qemu" "k3s-prod-2" {
  name = "k3s-prod-2"
  desc = ""
  vmid = "202"
  target_node = "prx-node-3"

  agent = 1

  clone = "ubuntu-cloud"
  cores = 2
  sockets = 1
  cpu_type = "x86-64-v2-AES"
  memory = 4096

  scsihw = "virtio-scsi-single"
  bootdisk = "scsi0"

  network {
    id = 0
    bridge = "vmbr2"
    model = "virtio"
  }

  serial {
    id = 0
  }

  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size = "10G"
          storage = "local-lvm"
        }
      }
    }
  }

  os_type = "cloud-init"
  ipconfig0 = "ip=10.10.30.22/24,gw=10.10.30.1"
  ciupgrade = true
  automatic_reboot = true
  nameserver = "10.10.30.1"
  ciuser = "root"
  cipassword = var.cipassword
  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgA2XcxVKik7Xfw7cCH//Han0MH63l+bul0vEWNYoIGTSCwFhLP8VXb1f70jFTHuNmBBbVcDLn9+jrXLjOFC1+bHKWtEYVWmrYxPRkPN0sTTxAgjfrmO5khxopo7zdxuzUNgAOpDrKS2cWC+m4J4bBFz/Tzu7LzpAIT/tZ3Oo6bZOK8PTCo7IW/z2ZPOIjDEb7K62LgLl8VFuePOXPvvFqxXvAvMn9pyzGuCGSD/nzfjFhuGGg8MOyzz8wnt889X7JsLHKvokJJEbo9IZNbmLnXV7kLUH+0fm7U55FyuCHnYPmKbY3ijmL8sYhxrQVZdZPCJ5/jWW9jGLmd7ce5mqw0tByQiWys301k/pfgRMhVry5J7oZJfSJmDOLo5wDFLfouxEk8sLltdu8WlFS0a04mdkGw1uoGYMCVboAK//S7b4050bv4YLKFMbrgvlhTRiLIsNrWgKXi9zCEXGp3IhFgXGyZzi1OCRuffwS3RRQ7Uj+qu0yi6PLOJV++uqXsIB/LmTvD8tdN1i5mESfIx+N1yFh16WcEOIIZzVStvbaFSlboFS2uUDgNSysRe9WivUFvmvKPQuKsv2e23k43a/pDVWgQpI9vcBoGzeiyB82O3qVpQIqZGgUF51cmLpuFC7feupkwzSWYBB4wMfY2OL5rZWPIbOIs/31YJY2Znv4eQ== bezdar-pc
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD97kVqyyvQNBj217zxD1U9nu3bOyzpEnHPtOVSA0HRNzlr3fjL3lyZjVYH7q+6xadZsRwTBDfCQrJ6wmvcFvC0ke199tVzgINJuadtlT+YB6mZsxyt9frcUZwpL+lRRpv7SZL9AhhG9gu+NyirXEdDkMZ0CWBxhCGtHDXLvfUQNl16Z7HDaQEm4BCi7ix9tufQ7JEa2RzyWNHN21rVTgr8lG/wyfi/hdc1yVarUBnCGPY0OwXO5a5lYc/Cq4H9A3T8t/rhBDoyr5mKbaeRUepERmyrVkYXCux2DzmEFfEwCtrzdPjX+2IvfsUETC8wrVZjVuUI2fGbCjUEfVR42XIz77qni1NeF3Njk7T2NaVyoVI++cm5ZoL3n3xhZY55DebMJE9u7bfufRtq8tGcQg8/sn5c9J3QKKWNgIwotL9RYrHUMOcyX+DFefFISWF8BqGakamRTmYv25ESkw4xsS4/692ysZ8xG1O7ZJ7dTC/yAFmRL4smR4OwLDycgDGBK1E= bezdar-laptop
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4llSHFZc1HwS9C5/pvvzJokdLCzB5ih3+RN5wU+FSc7vG+4jLkqifvPBRjTIjwF291DGyybSIqJss+wUHWXBncr5cTsXBmUXynZJCkYTidclEQXiRRkqvkT2wFJF7EoFgV7EZqh5HOB0UWcvuCLvA6hHh4AdjMouLhWV+lNW771TjGut5rTCQ1MDnqMhGL5GryoBPeGb1VNWvGAKtcymje8C4oyCB6QZgwo9Mg7Brx8BfEx2rpVAd4h43vDI0hT12KVQRbKcKjGJ3wkiMAcoC9byENP1bPup2W60tPB7N87dtz87+VLChOIB+Wkie2j/FdQQSsjIrrXBSINrOvf4O0bJ4+g+2CUuYNP/igjnb6UChTDWfsvRNuqFwviTqTEz8yIIUuKKnSpR48Eia94LL2cXACjt+J+ChUlnd4n7pEjptRSxYEoApnclY9Jp6PKW0CoUydqKC8Z8riFHhrXSsrHDTp8xSyzP7CztnPatuowR5uJbQxXZ+XnNdx3dXJgU= devel
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClECPP90cspsCpgYuS2+Uw1NykFGOTKjuBTxoMTEEXaDOlLryobEeRRpBWQ6H2qVWeMiB/0BJQiUwFqy2VF5LCQxfacYb5VHhTy+ZTLtgG1SdVGUsKi8bxKds5Ehx3dk20gxyCF/H9yTd1MCR6Xy2roDuq3abuBlgodCdBCnyn3TnQpNu/VVuA4BmioAbI+NZ3IPWgFT8dCbiJbMt2ucl7YDU4ofAcjU2/wpJNhhmazHhSxJUlfVDhnl+kB4n/f9XyuTDYpw5D2oy1AxDCbSCFowFqL/3ognoBNkafqaBjz+IUzDiSvmysXXhaYH4ZgHPJYF+4pf+KiXfTufvMAvOeTlCieZDiVeX9h3Qpl+5QcjWJmXkvQxEvoK3uOnioWspmnxPtXo/ih84+EgEvG48pBYuaELw+Fds1SXO/6+QWByXjqHoskm8hvWw8pgA7WYQXrsZ12wENafvQm4Xrd/ecPQRW6nvbwQP7goJK6OL034Aay2EklVdLmvyC9ZnhY8c= ansible
  EOF
}
