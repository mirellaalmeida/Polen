//        var instituicoes: [Checkpoint] = []
//        
//        //1 - Pegar endereços de todas as instituições do public container
//        CKInstituicao.fetchAddresses { results in
//            switch results {
//            case .success(let newInstituicoes):
//                //2 - Transformar em coordenadas
//                for instituicao in newInstituicoes {
//                    self.getCoordinate(addressString: instituicao.address) { (coordinate, error) in
//                        //3 - adicionar ao banco
//                        if (error == nil) {
//                            instituicoes.append(Checkpoint(title: instituicao.name, subtitle: instituicao.description, coordinate: coordinate))
//                        } else {
//                            print(error)
//                        }
//                    }
//                }
//                
//            case .failure(let error):
//                print(error)
//            }
//        }
//        
//        return instituicoes
//        
//        private func getCoordinate(addressString : String,
//                                   completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void) {
//            
//            let geocoder = CLGeocoder()
//            
//            geocoder.geocodeAddressString(addressString) { (placemarks, error) in
//                
//                if error == nil {
//                    if let placemark = placemarks?[0] {
//                        let location = placemark.location!
//                        
//                        completionHandler(location.coordinate, nil)
//                        return
//                    }
//                }
//                
//                completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
//            }
//        }
//        }
